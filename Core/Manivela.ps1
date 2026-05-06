. "$PSScriptRoot\Z60_Arithmetic.ps1"
. "$PSScriptRoot\MAV_Core.ps1"

Function Girar-Manivela {
    param(
        [int]$Pasos = 1,
        [switch]$DetectarEclipses,
        [switch]$Verbose
    )
    
    Write-Host "`n🔧 Girando la Anticitera Virtual" -ForegroundColor Yellow
    Write-Host "   Ciclos: $Pasos | Detección de eclipses: " -NoNewline
    if ($DetectarEclipses) { Write-Host "ACTIVA" -ForegroundColor Green } 
    else { Write-Host "INACTIVA" -ForegroundColor DarkGray }
    
    for ($p = 0; $p -lt $Pasos; $p++) {
        $NuevoEstado = $Global:MAV_Cube.Clone()
        
        for ($i = 0; $i -lt 216; $i++) {
            $idxA = $Global:TAT_Table[$i].X_Plus
            $idxB = $Global:TAT_Table[$i].Y_Plus
            
            $faseA = $Global:MAV_Cube[$idxA]
            $faseB = $Global:MAV_Cube[$idxB]
            
            $res = Get-Z60Mul $faseA $faseB
            $bias = [int]$Global:TAT_Table[$i].Bias
            
            $suma = $res + $bias
            $NuevoEstado[$i] = [byte]($suma % 60)
        }
        
        $Global:MAV_Cube = $NuevoEstado
        
        if ($DetectarEclipses) {
            for ($i = 0; $i -lt 216; $i++) {
                $vecino = $Global:TAT_Table[$i].X_Plus
                if (Detectar-Oposicion $Global:MAV_Cube[$i] $Global:MAV_Cube[$vecino]) {
                    $Global:ContadorEclipses++
                    $eclipse = [PSCustomObject]@{
                        Ciclo = $p + 1
                        Posicion = $i
                        Fase1 = $Global:MAV_Cube[$i]
                        Fase2 = $Global:MAV_Cube[$vecino]
                        Angulo = (Calcular-AnguloEntre $Global:MAV_Cube[$i] $Global:MAV_Cube[$vecino])
                    }
                    $Global:Eclipses += $eclipse
                    
                    if ($Verbose) {
                        Write-Host "🌑 ECLIPSE en ciclo $($p+1), posición $i" -ForegroundColor Magenta
                        Write-Host "   Ángulo: $($eclipse.Angulo)° (oposición exacta)" -ForegroundColor DarkMagenta
                    }
                }
            }
        }
        
        if ($Verbose -and ($p % 10 -eq 0) -and $p -gt 0) {
            Write-Host "   Progreso: $($p+1)/$Pasos ciclos" -ForegroundColor DarkCyan
        }
    }
    
    Write-Host "`n✅ Simulación completada" -ForegroundColor Green
}

Function Mostrar-Estadisticas {
    Write-Host "`n📊 ESTADÍSTICAS DEL MECANISMO" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan
    Write-Host "Total de ciclos ejecutados: $Global:CiclosTotales" -ForegroundColor White
    Write-Host "Eclipses detectados: $Global:ContadorEclipses" -ForegroundColor Yellow
    
    if ($Global:Eclipses.Count -gt 0) {
        Write-Host "`n📍 Últimos 5 eclipses:" -ForegroundColor White
        $Global:Eclipses | Select-Object -Last 5 | Format-Table Ciclo, Posicion, Angulo -AutoSize
    }
}

Function Mostrar-Como-Angulos {
    param([int]$Posicion)
    
    if ($Posicion -lt 0 -or $Posicion -ge 216) {
        Write-Host "Posición inválida" -ForegroundColor Red
        return
    }
    
    $fase = $Global:MAV_Cube[$Posicion]
    $angulo = Convertir-A-Grados $fase
    
    Write-Host "`n🔭 Posición $Posicion" -ForegroundColor Cyan
    Write-Host "   Fase: $fase / 60" -ForegroundColor White
    Write-Host "   Ángulo: $($angulo.Grados)° $($angulo.Minutos)'" -ForegroundColor Yellow
}

# --- INICIALIZACIÓN Y EJECUCIÓN ---
$Global:CiclosTotales = 0
$Global:MAV_Cube[0] = 45
Write-Host "🌍 Semilla planetaria: posición 0 con fase 45 (270°)" -ForegroundColor DarkYellow

Girar-Manivela -Pasos 60 -DetectarEclipses -Verbose
$Global:CiclosTotales = 60

Mostrar-Estadisticas

Write-Host "`n🎯 Comandos post-ejecución:" -ForegroundColor Yellow
Write-Host "   • Mostrar como ángulos: Mostrar-Como-Angulos -Posicion <0-215>" -ForegroundColor Gray
Write-Host "   • Ver matriz completa: `$Global:MAV_Cube | Out-GridView" -ForegroundColor Gray
Write-Host "   • Girar más ciclos: Girar-Manivela -Pasos <n> -DetectarEclipses" -ForegroundColor Gray

$Global:MAV_Cube | Out-GridView -Title "🌌 MAV - Mecanismo Analógico Virtual (Base 60)"
