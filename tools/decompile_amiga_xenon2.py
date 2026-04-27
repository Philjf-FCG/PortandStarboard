from __future__ import annotations

import argparse
import json
import re
import struct
from dataclasses import dataclass, field
from pathlib import Path

from capstone import CS_ARCH_M68K, CS_MODE_BIG_ENDIAN, CS_MODE_M68K_000, Cs

HUNK_HEADER = 0x03F3
HUNK_CODE = 0x03E9
HUNK_DATA = 0x03EA
HUNK_BSS = 0x03EB
HUNK_RELOC32 = 0x03EC
HUNK_SYMBOL = 0x03F0
HUNK_DEBUG = 0x03F1
HUNK_END = 0x03F2


@dataclass
class Segment:
    index: int
    hunk_type: str
    declared_size_bytes: int
    load_address: int
    data: bytes = b""
    relocation_entries: int = 0


@dataclass
class HunkFile:
    resident_libraries: list[str]
    segment_sizes: list[int]
    segments: list[Segment] = field(default_factory=list)


def read_u32_be(blob: bytes, cursor: int) -> tuple[int, int]:
    if cursor + 4 > len(blob):
        raise ValueError("Unexpected EOF while reading u32")
    value = struct.unpack_from(">I", blob, cursor)[0]
    return value, cursor + 4


def read_hunk_string(blob: bytes, cursor: int) -> tuple[str, int]:
    length_longs, cursor = read_u32_be(blob, cursor)
    if length_longs == 0:
        return "", cursor

    byte_count = length_longs * 4
    if cursor + byte_count > len(blob):
        raise ValueError("Unexpected EOF while reading hunk string")

    raw = blob[cursor:cursor + byte_count]
    cursor += byte_count
    return raw.rstrip(b"\x00").decode("latin-1", errors="replace"), cursor


def align4(value: int) -> int:
    return (value + 3) & ~3


def parse_hunk_file(blob: bytes) -> HunkFile:
    cursor = 0
    header_id, cursor = read_u32_be(blob, cursor)
    if header_id != HUNK_HEADER:
        raise ValueError("Not an Amiga HUNK file")

    resident_libraries: list[str] = []
    while True:
        lib, cursor = read_hunk_string(blob, cursor)
        if not lib:
            break
        resident_libraries.append(lib)

    table_size, cursor = read_u32_be(blob, cursor)
    first_hunk, cursor = read_u32_be(blob, cursor)
    last_hunk, cursor = read_u32_be(blob, cursor)

    segment_count = (last_hunk - first_hunk) + 1
    if segment_count <= 0 or table_size != segment_count:
        raise ValueError("Invalid hunk table geometry")

    segment_sizes: list[int] = []
    for _ in range(segment_count):
        size_field, cursor = read_u32_be(blob, cursor)
        size_longs = size_field & 0x3FFFFFFF
        segment_sizes.append(size_longs * 4)

    load_addresses: list[int] = []
    acc = 0
    for size in segment_sizes:
        load_addresses.append(acc)
        acc += align4(size)

    segments: list[Segment] = []
    current_segment: Segment | None = None
    current_index = -1

    while cursor < len(blob):
        hunk_raw, cursor = read_u32_be(blob, cursor)
        hunk_id = hunk_raw & 0xFFFF

        if hunk_id in (HUNK_CODE, HUNK_DATA, HUNK_BSS):
            current_index += 1
            if current_index >= segment_count:
                break

            size_longs, cursor = read_u32_be(blob, cursor)
            payload_size = size_longs * 4

            if hunk_id == HUNK_BSS:
                payload = b""
                hunk_type = "BSS"
            else:
                if cursor + payload_size > len(blob):
                    raise ValueError("Unexpected EOF while reading segment payload")
                payload = blob[cursor:cursor + payload_size]
                cursor += payload_size
                hunk_type = "CODE" if hunk_id == HUNK_CODE else "DATA"

            current_segment = Segment(
                index=current_index,
                hunk_type=hunk_type,
                declared_size_bytes=segment_sizes[current_index],
                load_address=load_addresses[current_index],
                data=payload,
            )
            segments.append(current_segment)
            continue

        if hunk_id == HUNK_RELOC32:
            if current_segment is None:
                raise ValueError("Relocation chunk without active segment")

            while True:
                count, cursor = read_u32_be(blob, cursor)
                if count == 0:
                    break
                _, cursor = read_u32_be(blob, cursor)  # target segment index
                current_segment.relocation_entries += count
                cursor += count * 4
            continue

        if hunk_id == HUNK_SYMBOL:
            while True:
                name_len, cursor = read_u32_be(blob, cursor)
                if name_len == 0:
                    break
                cursor += name_len * 4
                _, cursor = read_u32_be(blob, cursor)
            continue

        if hunk_id == HUNK_DEBUG:
            debug_longs, cursor = read_u32_be(blob, cursor)
            cursor += debug_longs * 4
            continue

        if hunk_id == HUNK_END:
            current_segment = None
            continue

        raise ValueError(f"Unsupported hunk type: 0x{hunk_id:04X}")

    return HunkFile(
        resident_libraries=resident_libraries,
        segment_sizes=segment_sizes,
        segments=segments,
    )


def disassemble_68000(hunk: HunkFile, max_insn_per_segment: int = 4000) -> list[str]:
    md = Cs(CS_ARCH_M68K, CS_MODE_BIG_ENDIAN | CS_MODE_M68K_000)
    lines: list[str] = []

    for segment in hunk.segments:
        if segment.hunk_type != "CODE":
            continue

        lines.append(
            f"\n; segment_{segment.index:02d} type={segment.hunk_type} "
            f"load=0x{segment.load_address:08X} size={len(segment.data)}"
        )

        for i, insn in enumerate(md.disasm(segment.data, segment.load_address)):
            if i >= max_insn_per_segment:
                lines.append("; ... truncated ...")
                break
            bytes_hex = insn.bytes.hex(" ")
            lines.append(f"{insn.address:08X}: {bytes_hex:<24} {insn.mnemonic} {insn.op_str}".rstrip())

    return lines


def extract_ascii_strings(blob: bytes, min_len: int = 4) -> list[tuple[int, str]]:
    pattern = re.compile(rb"[\x20-\x7E]{" + str(min_len).encode("ascii") + rb",}")
    return [(m.start(), m.group().decode("latin-1", errors="ignore")) for m in pattern.finditer(blob)]


def emit_pseudocode(disasm_lines: list[str], output_file: Path) -> None:
    with output_file.open("w", encoding="utf-8", newline="\n") as handle:
        handle.write("/*\n")
        handle.write(" * Auto-generated pseudo-C scaffolding from Amiga 68000 disassembly.\n")
        handle.write(" * This file is intended for porting analysis, not direct compilation.\n")
        handle.write(" */\n\n")
        handle.write("void xenon2_entry_stub(void) {\n")

        emitted = 0
        for line in disasm_lines:
            if line.startswith(";") or not line.strip():
                continue
            handle.write(f"    /* {line} */\n")
            emitted += 1
            if emitted >= 300:
                break

        handle.write("}\n")


def write_text(path: Path, lines: list[str]) -> None:
    path.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")


def run(input_path: Path, output_dir: Path) -> None:
    blob = input_path.read_bytes()
    hunk = parse_hunk_file(blob)

    output_dir.mkdir(parents=True, exist_ok=True)

    summary = {
        "input_file": str(input_path),
        "file_size_bytes": len(blob),
        "resident_libraries": hunk.resident_libraries,
        "segment_count": len(hunk.segments),
        "segments": [
            {
                "index": segment.index,
                "type": segment.hunk_type,
                "declared_size_bytes": segment.declared_size_bytes,
                "actual_data_bytes": len(segment.data),
                "load_address": segment.load_address,
                "relocation_entries": segment.relocation_entries,
            }
            for segment in hunk.segments
        ],
    }

    (output_dir / "amiga_hunk_summary.json").write_text(
        json.dumps(summary, indent=2),
        encoding="utf-8",
        newline="\n",
    )

    disasm_lines = disassemble_68000(hunk)
    write_text(output_dir / "amiga_68000_disasm.asm", disasm_lines)

    all_payload = b"".join(segment.data for segment in hunk.segments if segment.data)
    strings = extract_ascii_strings(all_payload)
    write_text(output_dir / "amiga_strings.txt", [f"{offset:08X}: {text}" for offset, text in strings])

    emit_pseudocode(disasm_lines, output_dir / "amiga_decompiled_pseudocode.c")

    readme_lines = [
        "# Amiga Xenon2 68000 Decompilation",
        "",
        f"- Input: {input_path}",
        f"- Segments parsed: {len(hunk.segments)}",
        f"- CODE segments: {sum(1 for s in hunk.segments if s.hunk_type == 'CODE')}",
        "",
        "## Outputs",
        "- amiga_hunk_summary.json",
        "- amiga_68000_disasm.asm",
        "- amiga_strings.txt",
        "- amiga_decompiled_pseudocode.c",
    ]
    write_text(output_dir / "README_AMIGA.md", readme_lines)


def main() -> None:
    parser = argparse.ArgumentParser(description="Decompile Amiga Xenon2 68000 executable")
    parser.add_argument("--input", required=True, help="Path to Amiga executable")
    parser.add_argument("--out", required=True, help="Output directory")
    args = parser.parse_args()

    run(Path(args.input).resolve(), Path(args.out).resolve())


if __name__ == "__main__":
    main()
