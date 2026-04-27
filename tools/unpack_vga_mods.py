from __future__ import annotations

import argparse
import math
from pathlib import Path

from PIL import Image, ImageDraw


def st_word_to_rgba(word: int) -> tuple[int, int, int, int]:
    r = ((word >> 8) & 0x7) * 36
    g = ((word >> 4) & 0x7) * 36
    b = (word & 0x7) * 36
    return r, g, b, 255


def load_stage_palette(stage_dir: Path) -> list[tuple[int, int, int, int]]:
    sprites_file = stage_dir / "SPRITES.VGA"
    if not sprites_file.exists():
        # Fallback palette if stage sprite file is unavailable.
        palette = [(0, 0, 0, 0)]
        for i in range(1, 16):
            v = min(255, i * 17)
            palette.append((v, v, v, 255))
        return palette

    blob = sprites_file.read_bytes()
    palette = [(0, 0, 0, 0)]
    for i in range(0, min(18, len(blob)), 2):
        palette.append(st_word_to_rgba(int.from_bytes(blob[i:i + 2], "big")))

    while len(palette) < 16:
        idx = len(palette)
        v = min(255, idx * 18)
        palette.append((v, v, v, 255))

    return palette


def detect_mods_start(blob: bytes) -> int:
    # S1 has an all-zero 0x80-byte prefix; other stages begin immediately.
    if len(blob) >= 0x80 and blob[:0x80] == bytes(0x80) and (len(blob) - 0x80) % 128 == 0:
        return 0x80
    if len(blob) % 128 == 0:
        return 0

    # Last resort: align forward to nearest 128-byte boundary.
    remainder = len(blob) % 128
    return remainder


def decode_tile(tile_blob: bytes, palette: list[tuple[int, int, int, int]]) -> Image.Image:
    image = Image.new("RGBA", (16, 16), (0, 0, 0, 0))

    for y in range(16):
        row = tile_blob[y * 8:(y + 1) * 8]
        p0 = int.from_bytes(row[0:2], "big")
        p1 = int.from_bytes(row[2:4], "big")
        p2 = int.from_bytes(row[4:6], "big")
        p3 = int.from_bytes(row[6:8], "big")

        for x in range(16):
            shift = 15 - x
            idx = (
                ((p0 >> shift) & 1)
                | (((p1 >> shift) & 1) << 1)
                | (((p2 >> shift) & 1) << 2)
                | (((p3 >> shift) & 1) << 3)
            )
            if idx == 0:
                continue
            image.putpixel((x, y), palette[idx])

    return image


def build_sheet(tiles: list[Image.Image], title: str) -> Image.Image:
    cols = 16
    rows = math.ceil(len(tiles) / cols) if tiles else 1
    cell_w = 20
    cell_h = 24

    sheet = Image.new("RGBA", (cols * cell_w, rows * cell_h + 16), (12, 12, 16, 255))
    draw = ImageDraw.Draw(sheet)

    for i, tile in enumerate(tiles):
        col = i % cols
        row = i // cols
        x = (col * cell_w) + 2
        y = (row * cell_h) + 14
        sheet.alpha_composite(tile, (x, y))

    draw.text((6, 2), title, fill=(255, 220, 130, 255))
    return sheet


def extract_stage(root: Path, stage: str, out_dir: Path) -> int:
    stage_dir = root / stage
    mods_file = stage_dir / "MODS.VGA"
    if not mods_file.exists():
        return 0

    palette = load_stage_palette(stage_dir)
    blob = mods_file.read_bytes()
    start = detect_mods_start(blob)
    payload = blob[start:]

    tile_count = len(payload) // 128
    payload = payload[:tile_count * 128]

    stage_out = out_dir / f"{stage}_mods_tiles"
    stage_out.mkdir(parents=True, exist_ok=True)

    tiles: list[Image.Image] = []
    for i in range(tile_count):
        tile_blob = payload[i * 128:(i + 1) * 128]
        tile = decode_tile(tile_blob, palette)
        tiles.append(tile)
        tile.save(stage_out / f"tile_{i:04d}.png")

    sheet = build_sheet(tiles, f"{stage} MODS.VGA ({tile_count} tiles, start=0x{start:X})")
    sheet.save(out_dir / f"{stage}_mods_sheet.png")

    return tile_count


def main() -> None:
    parser = argparse.ArgumentParser(description="Unpack Xenon2 MODS.VGA into 16x16 planar tile PNGs")
    parser.add_argument("--root", required=True, help="Path to Xenon2Me root directory")
    parser.add_argument("--out", required=True, help="Output directory")
    args = parser.parse_args()

    root = Path(args.root).resolve()
    out_dir = Path(args.out).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    total = 0
    for stage in ["S1", "S2", "S3", "S4", "S5"]:
        count = extract_stage(root, stage, out_dir)
        total += count
        print(f"{stage}: extracted {count} tiles")

    print(f"Total MODS tiles extracted: {total}")


if __name__ == "__main__":
    main()
