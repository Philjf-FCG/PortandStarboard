# Xenon II Porting Notes

## Source Inputs
- Amiga originals (Motorola 68000):
  - `Xenon II - Megablast (1989)(ImageWorks)[cr BS1][h Deejay99][t +3 BS1](Disk 1 of 2).adf`
  - `Xenon II - Megablast (1989)(ImageWorks)[cr BS1][h Deejay99][t +3 BS1](Disk 2 of 2).adf`
- DOS build: `xenon2/Xenon2Me/XENON2.EXE`

## Decompilation Outputs
All generated analysis artifacts are in `decompilation/`:
- DOS x86 disassembly and pseudo-C
- Amiga 68000 disassembly and pseudo-C
- Header/segment metadata
- Extracted strings

## Modern Rebuild Target
- Project: `Xenon2Modern/`
- Framework: `net10.0-windows`
- Architecture: `x64`
- Includes original data/art archives in build output under `assets/`

## Playable Port Status
- The startup path now launches a playable vertical-shooter loop (`GameForm`).
- Gameplay systems implemented in C#:
  - player movement
  - firing and projectile updates
  - enemy spawning and motion patterns
  - collision detection and damage
  - scoring, lives, stages, game-over/restart flow
  - scrolling background rendering
- Original packaged assets are consumed from `assets/` and converted into runtime sprites.

## Art Asset Migration Status
- The previous migration path produced scrambled visuals because sprite generation sampled arbitrary byte windows from legacy blobs.
- Asset generation now uses deterministic texture synthesis from both available sources:
  - DOS data files (`S1/SPRITES.VGA`, `S1/MODS.VGA`, `X2WEAPS.DAT`)
  - Amiga extracted binaries (`amiga/disk1/Xenon2/DJ99`, `amiga/disk1/Xenon2/Xenon2`)
- Result: stable, coherent in-game art (player, enemy, bullets, explosions, background) with no scrambling artifacts.
- Importer layer added: custom sprites now override generated art when found.
  - Search paths include `user-sprites/` at workspace root, `assets/user-sprites/`, `assets/imports/`, or `XENON2_SPRITES_PATH`.
  - Supports direct PNG files (`player.png`, `enemy.png`, `bullet.png`, `background.png`, `explosion.png`).
  - Supports sprite sheet import with `sprite-manifest.json` + `sheet.png`.
- Supplemental imports are now active:
  - `...Font.png` is parsed into a bitmap HUD font atlas and used for HUD/game-over text.
  - `...Items.png` is auto-sliced into item icons and used in HUD icon strips/life markers.
- `SPRITES.VGA` unpacking format has now been partially recovered:
  - 8-word little-endian header per sprite record
  - 5 planar 32-bit row streams (mask + 4 color planes), big-endian bit order
  - record size: `16 + (height * 20)`
- Unpacker tool: `tools/unpack_vga_sprites.py`
  - Example: `c:/DevProjects/Decompile/.venv/Scripts/python.exe tools/unpack_vga_sprites.py --root xenon2/Xenon2Me --out art_debug/unpacked`
  - Outputs contact sheets and per-sprite PNGs for `S1..S5/SPRITES.VGA`
- `MODS.VGA` unpacking format has now been recovered as stage tile graphics:
  - 4-plane planar `16x16` tiles
  - tile size: `128 bytes` (8 bytes per row for 16 rows)
  - possible `0x80` zero-byte file prefix before tile data
- Unpacker tool: `tools/unpack_vga_mods.py`
  - Example: `c:/DevProjects/Decompile/.venv/Scripts/python.exe tools/unpack_vga_mods.py --root xenon2/Xenon2Me --out art_debug/mods_unpacked`
  - Outputs `S*_mods_sheet.png` and per-tile PNG folders for `S1..S5/MODS.VGA`
- For pixel-perfect original sprites, we still need either:
  - documented/decompressed native sprite format specs, or
  - an alternate source with extracted bitmaps/sprite sheets.

### Controls
- Move: `Arrow keys` or `W A S D`
- Fire: `Space` or `Ctrl`
- Restart after game over: `Enter`

## Current Reverse Engineering Status
- Disk 1 (ADF): parsed and extracted successfully, including main `Xenon2` 68000 executable.
- Disk 2 (ADF): filesystem parser reports invalid boot block; this is likely due to nonstandard/copy-protected track layout.
- The Win11 rebuild currently provides a modern asset explorer shell and decompilation pipeline artifacts, suitable as a base for gameplay logic porting.

## One-command Pipeline
From workspace root:

```powershell
.\rebuild_xenon2.ps1
```
