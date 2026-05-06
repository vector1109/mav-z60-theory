# =========================
# Archivo: MAV_Core.ps1
# =========================

. "$PSScriptRoot\..\Z60\Z60_Arithmetic.ps1"

Function Build-MAVTopology {
    $Topology = New-Object psobject[] 216

    for ($z = 0; $z -lt 6; $z++) {
        for ($y = 0; $y -lt 6; $y++) {
            for ($x = 0; $x -lt 6; $x++) {
                $idx = ($z * 36) + ($y * 6) + $x

                $Topology[$idx] = [PSCustomObject]@{
                    Index  = $idx
                    X      = $x
                    Y      = $y
                    Z      = $z
                    X_Plus = ($z * 36) + ($y * 6) + (($x + 1) % 6)
                    Y_Plus = ($z * 36) + ((($y + 1) % 6) * 6) + $x
                    Bias   = [byte](($x + $y + $z) % 60)
                }
            }
        }
    }

    return $Topology
}

Function Initialize-MAVState {
    param(
        [byte]$SeedPhase = 0,
        [int]$SeedIndex = 0
    )

    $Global:MAV_State = New-Object byte[] 216
    $Global:MAV_State[$SeedIndex] = $SeedPhase
}

Function Step-MAV {
    $Next = $Global:MAV_State.Clone()

    for ($i = 0; $i -lt 216; $i++) {
        $a = $Global:MAV_State[$Global:MAV_Topology[$i].X_Plus]
        $b = $Global:MAV_State[$Global:MAV_Topology[$i].Y_Plus]

        $res  = Get-Z60Mul $a $b
        $bias = [int]$Global:MAV_Topology[$i].Bias

        $Next[$i] = [byte](($res + $bias) % 60)
    }

    $Global:MAV_State = $Next
    $Global:MAV_Ticks++
}

Function Reset-MAV {
    $Global:MAV_Topology = Build-MAVTopology
    $Global:MAV_State    = New-Object byte[] 216
    $Global:MAV_Ticks    = 0
}

Function Initialize-MAV {
    if (-not $Global:MAV_Topology) {
        Reset-MAV

        Write-Host "[OK] MAV Core inicializado (216 nodos)" -ForegroundColor Green
        Write-Host "    Topología discreta 6x6x6 cargada" -ForegroundColor DarkGreen
    }
}

Initialize-MAV