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

## Current Reverse Engineering Status
- Disk 1 (ADF): parsed and extracted successfully, including main `Xenon2` 68000 executable.
- Disk 2 (ADF): filesystem parser reports invalid boot block; this is likely due to nonstandard/copy-protected track layout.
- The Win11 rebuild currently provides a modern asset explorer shell and decompilation pipeline artifacts, suitable as a base for gameplay logic porting.

## One-command Pipeline
From workspace root:

```powershell
.\rebuild_xenon2.ps1
```
