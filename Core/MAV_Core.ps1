Function Build-TAT-Table {
    $Table = New-Object psobject[] 216
    for ($z = 0; $z -lt 6; $z++) {
        for ($y = 0; $y -lt 6; $y++) {
            for ($x = 0; $x -lt 6; $x++) {
                $idx = ($z * 36) + ($y * 6) + $x
                $Table[$idx] = [PSCustomObject]@{
                    X_Plus = ($z * 36) + ($y * 6) + (($x + 1) % 6)
                    Y_Plus = ($z * 36) + ((($y + 1) % 6) * 6) + $x
                    Bias   = [byte](($x + $y + $z) % 60)
                }
            }
        }
    }
    return $Table
}

Function Engranar-Con-Acarreo {
    param([byte]$FaseA, [byte]$FaseB)
    $producto = Get-Z60Mul $FaseA $FaseB
    $carro = [math]::Floor($producto / 60)
    $fase = $producto % 60
    return @($fase, $carro)
}

Function Detectar-Oposicion {
    param([byte]$Fase1, [byte]$Fase2)
    $diferencia = [math]::Abs($Fase1 - $Fase2)
    return ($diferencia -eq 30)
}

Function Calcular-AnguloEntre {
    param([byte]$Fase1, [byte]$Fase2)
    $dif = [math]::Abs($Fase1 - $Fase2)
    return $dif * 6
}

$Global:TAT_Table = Build-TAT-Table
$Global:MAV_Cube = New-Object byte[] 216
$Global:ContadorEclipses = 0
$Global:Eclipses = @()

Write-Host "[OK] Malla 6x6x6 cargada con engranajes." -ForegroundColor Green
Write-Host "    Capacidad: detección de oposiciones (eclipses)" -ForegroundColor DarkGreen
