$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$amigaDisk1 = Join-Path $root "Xenon II - Megablast (1989)(ImageWorks)[cr BS1][h Deejay99][t +3 BS1](Disk 1 of 2).adf"
$amigaExtractDir = Join-Path $root "amiga_extracted\disk1"
$amigaExe = Join-Path $amigaExtractDir "Xenon2\Xenon2"
$exePath = Join-Path $root "xenon2\Xenon2Me\XENON2.EXE"
$outDir = Join-Path $root "decompilation"
$python = Join-Path $root ".venv\Scripts\python.exe"

if (!(Test-Path $python)) {
    throw "Python environment not found at $python"
}

if (!(Test-Path $amigaExtractDir)) {
    New-Item -ItemType Directory -Path $amigaExtractDir | Out-Null
}

Write-Host "[1/3] Extracting Amiga disk 1 filesystem..."
if (!(Test-Path (Join-Path $amigaExtractDir "Xenon2"))) {
    & $python -m amitools.tools.xdftool $amigaDisk1 unpack $amigaExtractDir
}

Write-Host "[2/3] Decompiling 68000 and DOS executables..."
& $python (Join-Path $root "tools\decompile_amiga_xenon2.py") --input $amigaExe --out $outDir
& $python (Join-Path $root "tools\decompile_xenon2.py") --exe $exePath --out $outDir

Write-Host "[3/3] Building Windows 11 x64 project..."
Push-Location (Join-Path $root "Xenon2Modern")
try {
    dotnet build -c Release -p:Platform=x64
}
finally {
    Pop-Location
}

Write-Host "Done."
Write-Host "Artifacts: $outDir"
Write-Host "Build output: $root\Xenon2Modern\bin\x64\Release\net10.0-windows"
