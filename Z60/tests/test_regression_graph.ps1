Write-Host ""
Write-Host "Z60 — Regression Graph Validation"
Write-Host "================================="

$ErrorActionPreference = "Stop"

# ------------------------------------------------------------
# Load canonical runtime
# ------------------------------------------------------------

. "$PSScriptRoot\..\..\Core\Z60_Core.ps1"

# ------------------------------------------------------------
# Execute canonical validation
# ------------------------------------------------------------

& "$PSScriptRoot\..\..\Validation\Run-CanonicalValidation.ps1" | Out-Null

# ------------------------------------------------------------
# Expected canonical invariants
# ------------------------------------------------------------

$ExpectedNodes = 60
$ExpectedComponents = 8
$ExpectedDepth = 2

$ExpectedIdempotents = @(
    0,1,16,21,25,36,40,45
)

$ExpectedBasins = @{
    0  = 2
    1  = 16
    16 = 16
    21 = 8
    25 = 4
    36 = 8
    40 = 4
    45 = 2
}

# ------------------------------------------------------------
# Load generated validation markdown
# ------------------------------------------------------------

$ReportPath = "Validation/Figures/z60_graph_validation.md"

if (!(Test-Path $ReportPath)) {
    throw "Missing validation report"
}

$Report = Get-Content $ReportPath -Raw

# ------------------------------------------------------------
# Verify node count
# ------------------------------------------------------------

if ($Report -notmatch "Nodes: 60") {
    throw "Regression failure: node count mismatch"
}

Write-Host "[OK] Nodes"

# ------------------------------------------------------------
# Verify components
# ------------------------------------------------------------

if ($Report -notmatch "Components: 8") {
    throw "Regression failure: component count mismatch"
}

Write-Host "[OK] Components"

# ------------------------------------------------------------
# Verify depth
# ------------------------------------------------------------

if ($Report -notmatch "Max Depth: 2") {
    throw "Regression failure: depth mismatch"
}

Write-Host "[OK] Depth"

# ------------------------------------------------------------
# Verify idempotents
# ------------------------------------------------------------

foreach ($id in $ExpectedIdempotents) {

    if ($Report -notmatch "\b$id\b") {
        throw "Regression failure: missing idempotent $id"
    }
}

Write-Host "[OK] Idempotents"

# ------------------------------------------------------------
# Verify basin sizes
# ------------------------------------------------------------

foreach ($key in $ExpectedBasins.Keys) {

    $value = $ExpectedBasins[$key]

    if ($Report -notmatch "\|\s*$key\s*\|\s*$value\s*\|") {
        throw "Regression failure: basin mismatch for $key"
    }
}

Write-Host "[OK] Basin sizes"

# ------------------------------------------------------------
# Final summary
# ------------------------------------------------------------

Write-Host ""
Write-Host "Regression validation complete."
Write-Host "[SYSTEM STATUS] TOPOLOGY LOCK VERIFIED"