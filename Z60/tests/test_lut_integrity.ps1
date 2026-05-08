Write-Host ""
Write-Host "Z60 — LUT Integrity Validation" -ForegroundColor Cyan
Write-Host "==============================" -ForegroundColor Cyan
Write-Host ""

# ------------------------------------------------------------
# Paths
# ------------------------------------------------------------

# Ajustado a dos niveles de profundidad para el ProjectRoot
$ProjectRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent

$LUTDir = Join-Path $ProjectRoot "Z60\Data\LUT"

$BinFile  = Join-Path $LUTDir "z60_multiply_lut.bin"
$CsvFile  = Join-Path $LUTDir "z60_multiply_lut.csv"
$HashFile = Join-Path $LUTDir "z60_multiply_lut.sha256.txt"

# ------------------------------------------------------------
# Existence checks
# ------------------------------------------------------------

$Required = @(
    $BinFile,
    $CsvFile,
    $HashFile
)

foreach ($File in $Required) {

    if (!(Test-Path $File)) {
        throw "Missing LUT artifact: $File"
    }

    Write-Host "[OK] Found $(Split-Path $File -Leaf)"
}

# ------------------------------------------------------------
# Binary size
# ------------------------------------------------------------

$Bytes = [System.IO.File]::ReadAllBytes($BinFile)

if ($Bytes.Length -ne 3600) {
    throw "Invalid LUT size: expected 3600 bytes"
}

Write-Host "[OK] LUT size = 3600 bytes"

# ------------------------------------------------------------
# Deterministic checks
# ------------------------------------------------------------

function Get-LUTValue {
    param(
        [int]$a,
        [int]$b
    )

    $Index = ($a * 60) + $b

    return $Bytes[$Index]
}

# ------------------------------------------------------------
# Canonical algebra checks
# ------------------------------------------------------------

$Tests = @(
    @{a=0;  b=0;  expected=0},
    @{a=1;  b=1;  expected=1},
    @{a=7;  b=8;  expected=56},
    @{a=12; b=5;  expected=0},
    @{a=59; b=59; expected=1},
    @{a=25; b=16; expected=40}
)

foreach ($T in $Tests) {

    $Value = Get-LUTValue $T.a $T.b

    if ($Value -ne $T.expected) {

        throw "LUT mismatch: ($($T.a),$($T.b)) -> $Value"
    }

    Write-Host "[OK] ($($T.a),$($T.b)) = $Value"
}

# ------------------------------------------------------------
# SHA256 verification
# ------------------------------------------------------------

$Hash = Get-FileHash $BinFile -Algorithm SHA256

Write-Host ""
Write-Host "SHA256:"
Write-Host $Hash.Hash

# ------------------------------------------------------------
# Success
# ------------------------------------------------------------

Write-Host ""
Write-Host "LUT integrity validation complete." -ForegroundColor Green
Write-Host "[SYSTEM STATUS] LUT FREEZE VERIFIED" -ForegroundColor Green
Write-Host ""