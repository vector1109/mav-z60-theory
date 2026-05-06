# =========================
# Archivo: Observer_Log.ps1
# =========================

. "$PSScriptRoot\Observer_Opposition.ps1"

Function Initialize-ObserverLogStorage {
    if (-not $Global:Observer_Log) {
        $Global:Observer_Log = @()
    }
}

Function Add-ObserverEvents {
    param([array]$Events)

    Initialize-ObserverLogStorage

    foreach ($event in $Events) {
        $Global:Observer_Log += [PSCustomObject]@{
            Tick   = $event.Tick
            Type   = "Opposition"
            IndexA = $event.IndexA
            IndexB = $event.IndexB
            Angle  = $event.Angle
        }
    }
}

Function Show-ObserverLog {
    Initialize-ObserverLogStorage

    Write-Host "`n📘 OBSERVER LOG" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan
    Write-Host ("Eventos registrados: {0}" -f $Global:Observer_Log.Count) -ForegroundColor White

    if ($Global:Observer_Log.Count -gt 0) {
        $Global:Observer_Log | Select-Object -Last 10 | Format-Table Tick, Type, IndexA, IndexB, Angle -AutoSize
    }
}

Function Export-ObserverLog {
    Initialize-ObserverLogStorage

    $outDir  = Join-Path $PSScriptRoot "..\Data"
    $outFile = Join-Path $outDir "observer_log.csv"

    if (-not (Test-Path $outDir)) {
        New-Item -ItemType Directory -Path $outDir | Out-Null
    }

    $Global:Observer_Log | Export-Csv $outFile -NoTypeInformation -Encoding UTF8
    Write-Host "[OK] Log exportado -> $outFile" -ForegroundColor Green
}

Function Clear-ObserverLog {
    $Global:Observer_Log = @()
    Write-Host "[OK] Observer Log limpiado" -ForegroundColor DarkYellow
}

Function Initialize-ObserverLog {
    Initialize-ObserverLogStorage

    if (-not $Global:Observer_LogLoaded) {
        $Global:Observer_LogLoaded = $true
        Write-Host "[OK] Observer Log cargado" -ForegroundColor Green
    }
}

Initialize-ObserverLog