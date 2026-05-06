# =========================
# Archivo: MAV_Engine.ps1
# =========================

. "$PSScriptRoot\MAV_Core.ps1"

Function Seed-MAV {
    param(
        [byte]$Phase = 45,
        [int]$Index = 0
    )

    Initialize-MAVState -SeedPhase $Phase -SeedIndex $Index

    Write-Host "[OK] Semilla aplicada -> índice $Index | fase $Phase" -ForegroundColor Yellow
}

Function Run-MAV {
    param(
        [int]$Steps = 60,
        [switch]$Verbose
    )

    Write-Host "`n▶ Ejecutando MAV ($Steps ciclos)" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan

    for ($i = 0; $i -lt $Steps; $i++) {
        Step-MAV

        if ($Verbose -and (($i + 1) % 10 -eq 0)) {
            Write-Host ("   Tick {0}/{1}" -f ($i + 1), $Steps) -ForegroundColor DarkGray
        }
    }

    Write-Host "`n[OK] Ejecución completada" -ForegroundColor Green
    Write-Host ("     Ticks acumulados: {0}" -f $Global:MAV_Ticks) -ForegroundColor DarkGreen
}

Function Reset-MAVEngine {
    Reset-MAV
    Write-Host "[OK] MAV reiniciado" -ForegroundColor DarkYellow
}

Function Get-MAVState {
    return $Global:MAV_State
}

Function Initialize-MAVEngine {
    if (-not $Global:MAV_EngineLoaded) {
        $Global:MAV_EngineLoaded = $true
        Write-Host "[OK] MAV Engine cargado" -ForegroundColor Green
    }
}

Initialize-MAVEngine