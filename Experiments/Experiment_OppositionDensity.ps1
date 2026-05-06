# ==========================================
# Archivo: Experiment_OppositionDensity.ps1
# ==========================================

. "$PSScriptRoot\..\Observers\Observer_Log.ps1"

Function Get-OppositionDensity {
    if (-not $Global:Observer_Log -or $Global:Observer_Log.Count -eq 0) {
        return @()
    }

    return $Global:Observer_Log |
        Group-Object Tick |
        Sort-Object Name |
        ForEach-Object {
            [PSCustomObject]@{
                Tick  = [int]$_.Name
                Count = $_.Count
            }
        }
}

Function Show-OppositionDensity {
    $density = Get-OppositionDensity

    Write-Host "`n📊 DENSIDAD DE OPOSICIONES" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan

    if ($density.Count -eq 0) {
        Write-Host "No hay eventos registrados." -ForegroundColor DarkYellow
        return
    }

    $density | Format-Table Tick, Count -AutoSize
}

Function Initialize-ExperimentOppositionDensity {
    if (-not $Global:Experiment_OppositionDensityLoaded) {
        $Global:Experiment_OppositionDensityLoaded = $true
        Write-Host "[OK] Experiment OppositionDensity cargado" -ForegroundColor Green
    }
}

Initialize-ExperimentOppositionDensity