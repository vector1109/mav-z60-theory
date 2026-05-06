# =========================
# Archivo: Observer_Opposition.ps1
# =========================

. "$PSScriptRoot\..\MAV\MAV_Engine.ps1"

Function Test-Opposition {
    param(
        [byte]$A,
        [byte]$B
    )

    return ([math]::Abs($A - $B) -eq 30)
}

Function Get-Oppositions {
    $events = @()

    for ($i = 0; $i -lt 216; $i++) {
        $neighbor = $Global:MAV_Topology[$i].X_Plus

        $a = $Global:MAV_State[$i]
        $b = $Global:MAV_State[$neighbor]

        if (Test-Opposition $a $b) {
            $events += [PSCustomObject]@{
                IndexA = $i
                IndexB = $neighbor
                PhaseA = $a
                PhaseB = $b
                Delta  = 30
                Angle  = 180
                Tick   = $Global:MAV_Ticks
            }
        }
    }

    return $events
}

Function Show-Oppositions {
    $events = Get-Oppositions

    Write-Host "`n🌗 OPOSICIONES DETECTADAS" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan
    Write-Host ("Tick actual: {0}" -f $Global:MAV_Ticks) -ForegroundColor White
    Write-Host ("Total: {0}" -f $events.Count) -ForegroundColor Yellow

    if ($events.Count -gt 0) {
        $events | Select-Object -First 10 | Format-Table IndexA, IndexB, PhaseA, PhaseB, Angle -AutoSize
    }
}

Function Initialize-ObserverOpposition {
    if (-not $Global:Observer_OppositionLoaded) {
        $Global:Observer_OppositionLoaded = $true
        Write-Host "[OK] Observer Opposition cargado" -ForegroundColor Green
    }
}

Initialize-ObserverOpposition