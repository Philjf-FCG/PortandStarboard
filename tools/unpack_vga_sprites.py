from __future__ import annotations

import argparse
import math
import struct
from dataclasses import dataclass
from pathlib import Path

from PIL import Image, ImageDraw


@dataclass
class SpriteRecord:
    offset: int
    header: tuple[int, int, int, int, int, int, int, int]
    width_hint: int
    height: int
    mask_popcount: int
    image: Image.Image


def st_word_to_rgb(word: int) -> tuple[int, int, int]:
    # Atari ST-style 3-bit per channel palette word: 0x0RGB.
    r = ((word >> 8) & 0x7) * 36
    g = ((word >> 4) & 0x7) * 36
    b = (word & 0x7) * 36
    return r, g, b


def load_palette(blob: bytes) -> list[tuple[int, int, int, int]]:
    palette: list[tuple[int, int, int, int]] = [(0, 0, 0, 0)]

    # SPRITES.VGA stores a compact stage palette in the first 9 words.
    for i in range(0, min(18, len(blob)), 2):
        word = struct.unpack_from(">H", blob, i)[0]
        r, g, b = st_word_to_rgb(word)
        palette.append((r, g, b, 255))

    while len(palette) < 16:
        idx = len(palette)
        v = min(255, idx * 18)
        palette.append((v, v, v, 255))

    return palette


def unpack_sprite(blob: bytes, offset: int, palette: list[tuple[int, int, int, int]]) -> SpriteRecord | None:
    if offset + 16 > len(blob):
        return None

    header = tuple(struct.unpack_from("<8H", blob, offset))
    if any(value > 63 for value in header):
        return None

    # Header fields are bounding/hotspot pairs in ascending order.
    if not (header[0] <= header[2] and header[1] <= header[3] and header[4] <= header[6] and header[5] <= header[7]):
        return None

    width_hint = header[6] + 1
    height = header[7] + 1
    if not (1 <= width_hint <= 64 and 1 <= height <= 64):
        return None

    record_size = 16 + (20 * height)
    if offset + record_size > len(blob):
        return None

    start = offset + 16
    mask_popcount = 0

    image = Image.new("RGBA", (32, height), (0, 0, 0, 0))
    for y in range(height):
        mask_row = int.from_bytes(blob[start + (y * 4): start + (y * 4) + 4], "big")
        p0 = int.from_bytes(blob[start + (height * 4) + (y * 4): start + (height * 4) + (y * 4) + 4], "big")
        p1 = int.from_bytes(blob[start + (height * 8) + (y * 4): start + (height * 8) + (y * 4) + 4], "big")
        p2 = int.from_bytes(blob[start + (height * 12) + (y * 4): start + (height * 12) + (y * 4) + 4], "big")
        p3 = int.from_bytes(blob[start + (height * 16) + (y * 4): start + (height * 16) + (y * 4) + 4], "big")

        mask_popcount += mask_row.bit_count()

        for x in range(32):
            shift = 31 - x
            visible = (mask_row >> shift) & 1
            if visible == 0:
                continue

            color_index = (
                ((p0 >> shift) & 1)
                | (((p1 >> shift) & 1) << 1)
                | (((p2 >> shift) & 1) << 2)
                | (((p3 >> shift) & 1) << 3)
            )
            if color_index == 0:
                color_index = 1
            image.putpixel((x, y), palette[color_index])

    # Reject obvious false positives from accidental header-like bytes.
    if mask_popcount < 16 or mask_popcount > (32 * height) - 2:
        return None

    return SpriteRecord(
        offset=offset,
        header=header,
        width_hint=width_hint,
        height=height,
        mask_popcount=mask_popcount,
        image=image,
    )


def iter_records(blob: bytes) -> list[SpriteRecord]:
    palette = load_palette(blob)
    records: list[SpriteRecord] = []

    for offset in range(0, len(blob) - 16, 4):
        record = unpack_sprite(blob, offset, palette)
        if record is None:
            continue

        # Keep records reasonably unique by offset spacing and exact header match.
        if records and offset - records[-1].offset < 8 and record.header == records[-1].header:
            continue

        records.append(record)

    return records


def trim_transparent(image: Image.Image) -> Image.Image:
    bbox = image.getbbox()
    if bbox is None:
        return image.copy()
    return image.crop(bbox)


def write_sheet(records: list[SpriteRecord], out_file: Path, title: str) -> None:
    if not records:
        return

    cols = 8
    cell_w = 52
    cell_h = 80
    rows = math.ceil(len(records) / cols)

    sheet = Image.new("RGBA", (cols * cell_w, rows * cell_h), (16, 16, 20, 255))
    draw = ImageDraw.Draw(sheet)

    for i, record in enumerate(records):
        row = i // cols
        col = i % cols
        x = col * cell_w + 10
        y = row * cell_h + 6

        sprite = trim_transparent(record.image)
        sheet.alpha_composite(sprite, (x, y))
        draw.text((x, y + 38), f"{record.offset:04X}", fill=(230, 230, 230, 255))

    draw.text((8, 2), title, fill=(255, 220, 130, 255))
    sheet.save(out_file)


def extract_file(input_file: Path, output_dir: Path) -> int:
    blob = input_file.read_bytes()
    records = iter_records(blob)

    stage_name = input_file.parent.name
    stage_dir = output_dir / f"{stage_name}_sprites_unpacked"
    stage_dir.mkdir(parents=True, exist_ok=True)

    for i, record in enumerate(records):
        sprite = trim_transparent(record.image)
        sprite.save(stage_dir / f"sprite_{i:03d}_{record.offset:04X}.png")

    write_sheet(records, output_dir / f"{stage_name}_sprites_sheet.png", f"{stage_name} SPRITES.VGA ({len(records)} records)")

    return len(records)


def main() -> None:
    parser = argparse.ArgumentParser(description="Unpack Xenon2 SPRITES.VGA planar records into PNG sprites")
    parser.add_argument("--root", required=True, help="Path to Xenon2Me root directory")
    parser.add_argument("--out", required=True, help="Output directory for unpacked images")
    args = parser.parse_args()

    root = Path(args.root).resolve()
    out = Path(args.out).resolve()
    out.mkdir(parents=True, exist_ok=True)

    total = 0
    for stage in ["S1", "S2", "S3", "S4", "S5"]:
        sprites_file = root / stage / "SPRITES.VGA"
        if not sprites_file.exists():
            continue

        count = extract_file(sprites_file, out)
        total += count
        print(f"{stage}: extracted {count} records")

    print(f"Total extracted sprite records: {total}")


if __name__ == "__main__":
    main()
