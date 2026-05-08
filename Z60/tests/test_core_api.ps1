Write-Host ""
Write-Host "Z60 — Core API Validation"
Write-Host "========================="

$ErrorActionPreference = "Stop"

# ------------------------------------------------------------
# Canonical API surface
# ------------------------------------------------------------

$ExpectedFunctions = @(
    "Invoke-Z60Multiply",
    "Invoke-Z60Square",
    "Get-Z60Idempotents",
    "Get-Z60Orbit",
    "Get-Z60Graph",
    "Get-Z60Basins"
)

# ------------------------------------------------------------
# Load runtime
# ------------------------------------------------------------

. "$PSScriptRoot\..\..\Core\Z60_Core.ps1"

# ------------------------------------------------------------
# Verify exported functions
# ------------------------------------------------------------

foreach ($fn in $ExpectedFunctions) {

    $cmd = Get-Command $fn -ErrorAction SilentlyContinue

    if ($null -eq $cmd) {
        throw "Missing API function: $fn"
    }

    Write-Host "[OK] $fn"
}

# ------------------------------------------------------------
# Validate deterministic multiplication
# ------------------------------------------------------------

$result = Invoke-Z60Multiply 7 13

if ($result -ne 31) {
    throw "Multiply regression detected"
}

Write-Host "[OK] Deterministic multiply"

# ------------------------------------------------------------
# Validate squaring
# ------------------------------------------------------------

$sq = Invoke-Z60Square 7

if ($sq -ne 49) {
    throw "Square regression detected"
}

Write-Host "[OK] Squaring"

# ------------------------------------------------------------
# Validate idempotents
# ------------------------------------------------------------

$ids = Get-Z60Idempotents

$expected = @(0,1,16,21,25,36,40,45)

foreach ($e in $expected) {

    if ($ids -notcontains $e) {
        throw "Idempotent regression: $e"
    }
}

Write-Host "[OK] Idempotent set"

# ------------------------------------------------------------
# Validate orbit determinism
# ------------------------------------------------------------

$orbit = Get-Z60Orbit 7

if ($orbit.Count -lt 2) {
    throw "Orbit regression detected"
}

Write-Host "[OK] Orbit generation"

# ------------------------------------------------------------
# Final summary
# ------------------------------------------------------------

Write-Host ""
Write-Host "Core API validation complete."
Write-Host "[SYSTEM STATUS] API FREEZE VERIFIED"