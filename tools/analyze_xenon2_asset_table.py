from __future__ import annotations

import argparse
import json
import struct
from pathlib import Path


ANCHOR = b"x2spr.dat"


def load_module_bytes(exe_path: Path) -> bytes:
    data = exe_path.read_bytes()
    if len(data) < 0x1C:
        raise ValueError("File too small for DOS MZ header")

    magic = data[:2]
    if magic != b"MZ":
        raise ValueError("Input is not an MZ executable")

    cblp, cp, cparhdr = struct.unpack_from("<HHH", data, 2)
    exe_size = cp * 512 if cblp == 0 else (cp - 1) * 512 + cblp
    module_start = cparhdr * 16
    return data[module_start:exe_size]


def read_cstring(blob: bytes, offset: int) -> tuple[str, int]:
    end = blob.find(b"\x00", offset)
    if end < 0:
        end = len(blob)
    text = blob[offset:end].decode("latin-1", errors="replace")
    return text, end + 1


def analyze(exe_path: Path, words_before_anchor: int = 48) -> dict:
    module = load_module_bytes(exe_path)
    anchor = module.find(ANCHOR)
    if anchor < 0:
        raise ValueError(f"Could not find anchor string: {ANCHOR!r}")

    window_bytes = words_before_anchor * 2
    start = max(0, anchor - window_bytes)
    prefix = module[start:anchor]

    words: list[dict] = []
    for i in range(0, len(prefix), 2):
        value = struct.unpack_from("<H", prefix, i)[0]
        words.append(
            {
                "module_offset": start + i,
                "hex": f"0x{value:04X}",
                "value": value,
            }
        )

    strings: list[dict] = []
    cursor = anchor
    while cursor < len(module):
        text, next_cursor = read_cstring(module, cursor)
        if not text:
            break
        if any(ord(ch) < 0x20 or ord(ch) > 0x7E for ch in text):
            break
        strings.append({"module_offset": cursor, "text": text})
        cursor = next_cursor

    return {
        "input_exe": str(exe_path),
        "module_size": len(module),
        "anchor_offset": anchor,
        "words_before_anchor": words,
        "strings_after_anchor": strings,
    }


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Dump Xenon2 DOS executable asset-file table and nearby constants"
    )
    parser.add_argument("--exe", required=True, help="Path to XENON2.EXE")
    parser.add_argument("--out", help="Optional JSON output path")
    parser.add_argument(
        "--words-before-anchor",
        type=int,
        default=48,
        help="How many 16-bit words to decode before x2spr.dat",
    )
    args = parser.parse_args()

    result = analyze(Path(args.exe).resolve(), words_before_anchor=args.words_before_anchor)

    if args.out:
        out_path = Path(args.out).resolve()
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(json.dumps(result, indent=2), encoding="utf-8", newline="\n")
        print(f"Wrote {out_path}")
        return

    print(f"Input EXE: {result['input_exe']}")
    print(f"Module size: {result['module_size']}")
    print(f"Anchor offset (x2spr.dat): 0x{result['anchor_offset']:05X}")

    print("\nWords before anchor:")
    for entry in result["words_before_anchor"]:
        print(
            f"  0x{entry['module_offset']:05X}: {entry['hex']} ({entry['value']})"
        )

    print("\nStrings after anchor:")
    for entry in result["strings_after_anchor"]:
        print(f"  0x{entry['module_offset']:05X}: {entry['text']}")


if __name__ == "__main__":
    main()
