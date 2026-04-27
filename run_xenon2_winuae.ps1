$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

$winuae = Join-Path $root "winuae64.exe"
if (!(Test-Path $winuae)) {
    throw "WinUAE not found: $winuae"
}

$disk1Src = Join-Path $root "Xenon II - Megablast (1989)(ImageWorks)[cr BS1][h Deejay99][t +3 BS1](Disk 1 of 2).adf"
$disk2Src = Join-Path $root "Xenon II - Megablast (1989)(ImageWorks)[cr BS1][h Deejay99][t +3 BS1](Disk 2 of 2).adf"

if (!(Test-Path -LiteralPath $disk1Src) -or !(Test-Path -LiteralPath $disk2Src)) {
    throw "Expected Xenon II ADF files in project root."
}

# Use short local names so WinUAE arg parsing is deterministic.
Copy-Item -LiteralPath $disk1Src -Destination (Join-Path $root "disk1.adf") -Force
Copy-Item -LiteralPath $disk2Src -Destination (Join-Path $root "disk2.adf") -Force

$configPath = Join-Path $root "winuae-xenon2.uae"
if (!(Test-Path $configPath)) {
    throw "Missing WinUAE profile: $configPath"
}

$kickstartRom = Join-Path $root "kickstart-1.3.rom"
$kickstartArg = if (Test-Path -LiteralPath $kickstartRom) {
    "kickstart_rom_file=$kickstartRom"
}
else {
    "kickstart_rom_file=:AROS"
}

# -f loads profile, -s overrides key fields for this run.
& $winuae -f $configPath -s $kickstartArg -s floppy0=disk1.adf -s floppy1=disk2.adf
