# Unpacked Xenon2 MODS Tile Art

These outputs were extracted from `S1..S5/MODS.VGA` using the recovered tile format:

- Data is planar 4bpp tile graphics
- Tile dimensions: `16x16`
- Per-row storage (8 bytes):
  - plane0: 2 bytes
  - plane1: 2 bytes
  - plane2: 2 bytes
  - plane3: 2 bytes
- Bit order: big-endian within each 16-bit plane word
- Tile size: `128 bytes`

Stage offset handling:
- Files may have a leading `0x80`-byte zero prefix before tile payload.
- Extractor auto-detects and skips this prefix when present.

Generated files:
- `S*_mods_sheet.png` tile contact sheets
- `S*_mods_tiles/` individual tile PNG files

Tool used:
- `tools/unpack_vga_mods.py`
