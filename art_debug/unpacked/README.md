# Unpacked Xenon2 Sprite Art

These outputs were extracted from `S1..S5/SPRITES.VGA` using the recovered planar format:

- Per-record header: 8 little-endian `u16` values
- Pixel payload: 5 planes per row block
  - Plane 0: 1-bit visibility mask
  - Planes 1-4: 4-bit indexed color data
- Row storage: 32 bits wide per plane row, big-endian bit order
- Record byte size: `16 + (height * 20)`, where `height = header[7] + 1`

Generated files:
- `S*_sprites_sheet.png` contact sheets
- `S*_sprites_unpacked/` individual PNGs

Notes:
- This is a true unpack of `SPRITES.VGA` records (not a raw byte visualization).
- Color mapping is derived from the compact stage palette at file start; additional palette work can further improve fidelity.
- `MODS.VGA` appears to use a different packing/layout and is not covered by this extractor yet.
