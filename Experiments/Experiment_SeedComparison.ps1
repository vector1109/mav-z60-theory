# ==========================================
# Archivo: Experiment_SeedComparison.ps1
# ==========================================

. "$PSScriptRoot\Experiment_OppositionDensity.ps1"

Function Compare-MAVSeeds {
    param(
        [byte[]]$Seeds = @(5,10,15,20,25,30,35,40,45,50,55),
        [int]$Steps = 60
    )

    $results = @()

    foreach ($seed in $Seeds) {
        Reset-MAVEngine
        Clear-ObserverLog

        Seed-MAV -Phase $seed
        Run-MAV -Steps $Steps

        $events = Get-Oppositions
        Add-ObserverEvents $events

        $density = Get-OppositionDensity
        $count = if ($density.Count -gt 0) {
            ($density | Measure-Object Count -Sum).Sum
        } else {
            0
        }

        $results += [PSCustomObject]@{
            Seed         = $seed
            Steps        = $Steps
            Oppositions  = $count
            DensityTicks = $density.Count
        }
    }

    return $results
}

Function Show-SeedComparison {
    param(
        [byte[]]$Seeds = @(5,10,15,20,25,30,35,40,45,50,55),
        [int]$Steps = 60
    )

    $results = Compare-MAVSeeds -Seeds $Seeds -Steps $Steps

    Write-Host "`n🧪 COMPARACIÓN DE SEMILLAS" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan

    $results | Format-Table Seed, Steps, Oppositions, DensityTicks -AutoSize
}

Function Initialize-ExperimentSeedComparison {
    if (-not $Global:Experiment_SeedComparisonLoaded) {
        $Global:Experiment_SeedComparisonLoaded = $true
        Write-Host "[OK] Experiment SeedComparison cargado" -ForegroundColor Green
    }
}

Initialize-ExperimentSeedComparison