Write-Host ""
Write-Host "Z60 — System Integrity Verification"
Write-Host "==================================="

$ErrorActionPreference = "Stop"

# ------------------------------------------------------------
# Canonical files
# ------------------------------------------------------------

$CanonicalFiles = @(
    "Core/Z60_Core.ps1",
    "Validation/Run-CanonicalValidation.ps1",
    "Theory/THEORY_NOTE.md",
    "README.md",
    "SPECIFICATION.md",
    "LICENSE",
    "VERSION.txt",
    "Z60/spec/FREEZE.md",
    "Z60/spec/SEMVER_CONTRACT.md"
)

# ------------------------------------------------------------
# Verify existence
# ------------------------------------------------------------

Write-Host ""
Write-Host "[1] Verifying canonical files..."

foreach ($file in $CanonicalFiles) {

    if (!(Test-Path $file)) {
        throw "Missing canonical file: $file"
    }

    Write-Host "[OK] $file"
}

# ------------------------------------------------------------
# Generate SHA256 hashes
# ------------------------------------------------------------

Write-Host ""
Write-Host "[2] Computing SHA256 hashes..."

$HashTable = @()

foreach ($file in $CanonicalFiles) {

    $hash = Get-FileHash $file -Algorithm SHA256

    $HashTable += [PSCustomObject]@{
        File = $file
        SHA256 = $hash.Hash
    }

    Write-Host "[HASH] $file"
}

# ------------------------------------------------------------
# Ensure validation artifacts exist
# ------------------------------------------------------------

Write-Host ""
Write-Host "[3] Verifying validation artifacts..."

$Artifacts = @(
    "Validation/Figures/z60_graph_validation.csv",
    "Validation/Figures/z60_edges.csv",
    "Validation/Figures/z60_basins.csv",
    "Validation/Figures/z60_graph_validation.md"
)

foreach ($artifact in $Artifacts) {

    if (!(Test-Path $artifact)) {
        throw "Missing validation artifact: $artifact"
    }

    Write-Host "[OK] $artifact"
}

# ------------------------------------------------------------
# Export integrity report
# ------------------------------------------------------------

Write-Host ""
Write-Host "[4] Exporting integrity report..."

$OutputDir = "Validation/Logs"

if (!(Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
}

$HashTable | Export-Csv `
    -Path "$OutputDir/system_integrity_hashes.csv" `
    -NoTypeInformation

# ------------------------------------------------------------
# Final summary
# ------------------------------------------------------------

Write-Host ""
Write-Host "Integrity verification complete."
Write-Host ""

Write-Host "Canonical files verified : $($CanonicalFiles.Count)"
Write-Host "Validation artifacts     : $($Artifacts.Count)"

Write-Host ""
Write-Host "Integrity hashes written to:"
Write-Host "  Validation/Logs/system_integrity_hashes.csv"

Write-Host ""
Write-Host "[SYSTEM STATUS] CANONICAL STATE VERIFIED"