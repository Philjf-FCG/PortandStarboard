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
  - Amiga extracted binaries (`amiga/disk1/Xenon2/Xenon2`, fallback `amiga/disk1/Xenon2/DJ99`)
- Note on cracked disk sets:
  - Some images boot `DJ99` first via startup-sequence, then chain to `Xenon2`.
  - Runtime byte-derived synthesis now prefers `Xenon2` specifically to avoid crack-intro contamination.
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
- Runtime now uses decoded `SPRITES.VGA` records as primary fallbacks for core gameplay sprites (player/enemy/bullet/explosion) when no user override PNG is provided.
  - This replaces the previous procedural placeholder shapes for those entities.
- Runtime now prefers fixed S1 `SPRITES.VGA` offsets for deterministic core visuals:
  - player: `0x07BC` (fallbacks `0x09FC`, `0x0C64`)
  - enemy: `0x2C00` (fallbacks `0x2A04`, `0x3CE8`)
  - bullet: `0x48EC` (fallbacks `0x48E4`, `0x48B4`, `0x20C8`)
- Explosion currently stays procedural as a safety fallback until a reliable dedicated explosion record is pinned.
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

## WinUAE Direct Run
- Added a repeatable WinUAE launcher script at `run_xenon2_winuae.ps1`.
- Added profile `winuae-xenon2.uae`.
- Launch command now works from project root and loads:
  - profile with `-f winuae-xenon2.uae`
  - built-in replacement ROM via `-s kickstart_rom_file=:AROS`
  - `disk1.adf` / `disk2.adf` via `-s floppy0=...` and `-s floppy1=...`
- WinUAE boot log location used for validation:
  - `C:\Users\Public\Documents\Amiga Files\WinUAE\winuaebootlog.txt`

Run:

```powershell
.\run_xenon2_winuae.ps1
```

## Deterministic Art/Map A-B Export
- Added headless diagnostics mode in `Xenon2Modern` for repeatable sprite/map exports.
- Use this to compare executable-byte source order without relying on manual screenshots.

Run both variants from workspace root:

```powershell
dotnet run --project Xenon2Modern\Xenon2Modern.csproj -c Release -p:Platform=x64 -- --export-assets art_debug\diag_xenon2_first --amiga-source-order xenon2-first
dotnet run --project Xenon2Modern\Xenon2Modern.csproj -c Release -p:Platform=x64 -- --export-assets art_debug\diag_dj99_first --amiga-source-order dj99-first
```

- Each export writes PNG artifacts and `summary.json` with SHA-256 digests.
- Current comparison result:
  - Sprite hashes differ for `player.png`, `enemy.png`, `explosion.png`.
  - Sprite hashes match for `bullet.png`, `background.png`.
  - Stage map previews and selected map decoders are unchanged across source-order variants.

## Sprite/Map Pipeline Evidence From Original EXE
- Added deterministic extractor `tools/analyze_xenon2_asset_table.py`.
- Generated artifact: `decompilation/xenon2_asset_table.json`.
- Confirmed contiguous asset-name table in the DOS module:
  - `x2spr.dat`, `x2weaps.dat`, `shop.dat`, `gr.dat`
  - `s1\map.cmp`, `s1\mods.vga`, `s1\sprites.vga`, `s1\events.pc`, `s1\eventsbg.pc`, `s1\paths.bin`
- Nearby 16-bit constants include repeated geometry-like values:
  - `0x0130` (304), `0x0120` (288), `0x0090` (144), `0x0088` (136), `0x0020` (32), `0x0010` (16)
- This supports current assumptions that stage background data is lane-constrained and map-height oriented (not full-screen tiled across width).
