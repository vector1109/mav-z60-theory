Write-Host ""
Write-Host "Z60 — Canonical LUT Generator" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# --- Cambio de Ruta Dinámica (Anidamiento Explícito) ---
$ProjectRoot = Split-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) -Parent
$OutputDir = Join-Path $ProjectRoot "Z60\Data\LUT"

if (!(Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

# ------------------------------------------------------------
# Canonical LUT
# ------------------------------------------------------------

# Layout: index = a * 60 + b | value = (a * b) mod 60
[byte[]]$LUT = New-Object byte[] 3600
$index = 0

for ($a = 0; $a -lt 60; $a++) {
    for ($b = 0; $b -lt 60; $b++) {
        $value = ($a * $b) % 60
        $LUT[$index] = [byte]$value
        $index++
    }
}

# ------------------------------------------------------------
# Export binary LUT
# ------------------------------------------------------------
$BinFile = Join-Path $OutputDir "z60_multiply_lut.bin"
[System.IO.File]::WriteAllBytes($BinFile, $LUT)

Write-Host "[OK] Binary LUT exported"
Write-Host "     $BinFile"

# ------------------------------------------------------------
# Export CSV reference
# ------------------------------------------------------------
$CsvFile = Join-Path $OutputDir "z60_multiply_lut.csv"
$Rows = @()

for ($a = 0; $a -lt 60; $a++) {
    $Row = @()
    for ($b = 0; $b -lt 60; $b++) {
        $Row += (($a * $b) % 60)
    }
    $Rows += ($Row -join ",")
}
$Rows | Set-Content $CsvFile

Write-Host "[OK] CSV LUT exported"
Write-Host "     $CsvFile"

# ------------------------------------------------------------
# SHA256
# ------------------------------------------------------------
$Hash = Get-FileHash $BinFile -Algorithm SHA256
$HashFile = Join-Path $OutputDir "z60_multiply_lut.sha256.txt"

@"
Z60 Canonical LUT SHA256
========================

File:
z60_multiply_lut.bin

SHA256:
$($Hash.Hash)

Entries:
3600

Ordering:
row-major

Runtime:
Z60 Canonical Runtime v1.0.0
"@ | Set-Content $HashFile

Write-Host "[OK] SHA256 exported"
Write-Host "     $HashFile"

Write-Host ""
Write-Host "Canonical LUT generation complete." -ForegroundColor Green
Write-Host ""
Write-Host "[SYSTEM STATUS] LUT FREEZE READY" -ForegroundColor Green
Write-Host ""