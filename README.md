# PortandStarboard

## Status Update (2026-04-27)

The project is now using the current local legacy asset pipeline as the primary direction.
No additional external sprite/map packs are being integrated right now.

### What Was Done Today

- Fixed Amiga byte-source priority so runtime prefers `Xenon2` over `DJ99` when both are present.
- Added deterministic asset export mode for repeatable A/B checks:
	- `--export-assets <output-folder>`
	- `--amiga-source-order xenon2-first|dj99-first`
- Exported and compared artifacts using SHA-256 summaries to validate real differences.
- Replaced procedural placeholder core sprites with decoded legacy `SPRITES.VGA` records.
- Added deterministic hard-mapped sprite offsets for:
	- player
	- enemy
	- bullet
- Kept explosion on procedural fallback for now (quality safety) until a reliable dedicated record is pinned.
- Confirmed map preview outputs remain stable across source-order variants.

## Build And Run Requirements

### Required Environment

- Windows (x64)
- .NET 10 SDK
- PowerShell

### Optional/Script-Specific Requirements

- Python virtual environment at `.venv` (required for `rebuild_xenon2.ps1`)
- Existing ADF files in repo root (required for extractor/emulator scripts)
- `winuae64.exe` and `winuae-xenon2.uae` (required only for WinUAE run)
- `kickstart-1.3.rom` is optional; launcher falls back to `:AROS`

## Build Commands

### Quick Build (Modern Port Only)

```powershell
dotnet build --project Xenon2Modern\Xenon2Modern.csproj -c Release -p:Platform=x64
```

### Run Modern Port

```powershell
dotnet run --project Xenon2Modern\Xenon2Modern.csproj -c Release -p:Platform=x64
```

### Full Pipeline (Extract + Decompile + Build)

```powershell
.\rebuild_xenon2.ps1
```

## Optional Diagnostics

Export deterministic runtime artifacts for comparison:

```powershell
dotnet run --project Xenon2Modern\Xenon2Modern.csproj -c Release -p:Platform=x64 -- --export-assets art_debug\diag_xenon2_first --amiga-source-order xenon2-first
dotnet run --project Xenon2Modern\Xenon2Modern.csproj -c Release -p:Platform=x64 -- --export-assets art_debug\diag_dj99_first --amiga-source-order dj99-first
```

## Related Docs

- `PORTING_NOTES.md` contains detailed reverse-engineering and migration notes.
