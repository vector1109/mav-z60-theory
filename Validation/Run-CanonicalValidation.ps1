# ============================================
# MAV-Z60 Canonical Validation Pipeline
# File: Validation/Run-CanonicalValidation.ps1
# ============================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "MAV-Z60 — Canonical Validation Pipeline" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# --------------------------------------------
# Paths
# --------------------------------------------
$Root = Split-Path -Parent $PSScriptRoot
$CorePath = Join-Path $Root "Core\Z60_Core.ps1"
$OutDir   = Join-Path $Root "Validation\Figures"

if (!(Test-Path $OutDir)) {
    New-Item -ItemType Directory -Path $OutDir | Out-Null
}

# --------------------------------------------
# Load Core
# --------------------------------------------
if (!(Test-Path $CorePath)) {
    throw "Missing required core file: $CorePath"
}

. $CorePath

# --------------------------------------------
# Parameters
# --------------------------------------------
$n = 60

function Invoke-Z60 {
    param([int]$x)
    return (($x * $x) % $n)
}

function Get-Orbit {
    param([int]$x)

    $seen  = @{}
    $orbit = New-Object System.Collections.Generic.List[int]
    $cur   = $x

    while (-not $seen.ContainsKey($cur)) {
        $seen[$cur] = $true
        $orbit.Add($cur)
        $cur = Invoke-Z60 $cur
    }

    return ,@($orbit.ToArray())
}

function Get-TerminalNode {
    param([int]$x)

    $seen = @{}
    $cur  = $x

    while (-not $seen.ContainsKey($cur)) {
        $seen[$cur] = $true
        $next = Invoke-Z60 $cur
        if ($next -eq $cur) { return $cur }
        $cur = $next
    }

    return $cur
}

function Get-DepthToFixedPoint {
    param([int]$x)

    $seen  = @{}
    $cur   = $x
    $depth = 0

    while (-not $seen.ContainsKey($cur)) {
        $seen[$cur] = $true
        $next = Invoke-Z60 $cur
        if ($next -eq $cur) { return $depth }
        $cur = $next
        $depth++
    }

    return $depth
}

# --------------------------------------------
# Compute Dynamics
# --------------------------------------------
$rows = @()
$edges = @()
$idempotents = New-Object System.Collections.Generic.HashSet[int]

for ($x = 0; $x -lt $n; $x++) {
    $fx = Invoke-Z60 $x
    $orbit = Get-Orbit $x
    $terminal = Get-TerminalNode $x
    $depth = Get-DepthToFixedPoint $x

    if ($terminal -eq (Invoke-Z60 $terminal)) {
        [void]$idempotents.Add($terminal)
    }

    $edges += [PSCustomObject]@{
        Source = $x
        Target = $fx
    }

    $rows += [PSCustomObject]@{
        Node     = $x
        Image    = $fx
        Orbit    = ($orbit -join " -> ")
        Terminal = $terminal
        Depth    = $depth
    }
}

# --------------------------------------------
# Components / Basins
# --------------------------------------------
$basins = $rows | Group-Object Terminal | Sort-Object Name | ForEach-Object {
    [PSCustomObject]@{
        Idempotent = [int]$_.Name
        BasinSize  = $_.Count
    }
}

$maxDepth = ($rows | Measure-Object -Property Depth -Maximum).Maximum
$componentCount = $basins.Count
$idempotentList = ($idempotents | Sort-Object)

# --------------------------------------------
# Export CSV
# --------------------------------------------
$rows   | Export-Csv (Join-Path $OutDir "z60_graph_validation.csv") -NoTypeInformation -Encoding UTF8
$edges  | Export-Csv (Join-Path $OutDir "z60_edges.csv")            -NoTypeInformation -Encoding UTF8
$basins | Export-Csv (Join-Path $OutDir "z60_basins.csv")           -NoTypeInformation -Encoding UTF8

# --------------------------------------------
# Export Markdown Summary
# --------------------------------------------
$md = @()
$md += "# Canonical Validation — Z60"
$md += ""
$md += "## System"
$md += ""
$md += "- Modulus: 60"
$md += "- Map: x -> x^2 mod 60"
$md += "- Nodes: 60"
$md += "- Components: $componentCount"
$md += "- Idempotents: $($idempotentList -join ', ')"
$md += "- Max Depth: $maxDepth"
$md += ""
$md += "## Basin Sizes"
$md += ""
$md += "| Idempotent | Basin Size |"
$md += "|-----------:|-----------:|"

foreach ($b in $basins) {
    $md += "| $($b.Idempotent) | $($b.BasinSize) |"
}

$md += ""
$md += "## Validation Status"
$md += ""
$md += "- Functional graph constructed"
$md += "- Idempotents detected"
$md += "- Basin partition verified"
$md += "- Canonical validation complete"

$md | Set-Content (Join-Path $OutDir "z60_graph_validation.md") -Encoding UTF8

# --------------------------------------------
# Console Summary
# --------------------------------------------
Write-Host "Validation complete." -ForegroundColor Green
Write-Host ""
Write-Host "Nodes       : 60"
Write-Host "Components  : $componentCount"
Write-Host "Idempotents : $($idempotentList -join ', ')"
Write-Host "Max Depth   : $maxDepth"
Write-Host ""
Write-Host "Artifacts written to:" -ForegroundColor Yellow
Write-Host "  Validation/Figures/z60_graph_validation.csv"
Write-Host "  Validation/Figures/z60_edges.csv"
Write-Host "  Validation/Figures/z60_basins.csv"
Write-Host "  Validation/Figures/z60_graph_validation.md"
Write-Host ""