# =========================
# Archivo: Z60_Properties.ps1
# =========================

. "$PSScriptRoot\Z60_Arithmetic.ps1"

Function Test-Z60Conmutatividad {
    for ($a = 0; $a -lt 60; $a++) {
        for ($b = 0; $b -lt 60; $b++) {
            if ((Get-Z60Mul $a $b) -ne (Get-Z60Mul $b $a)) {
                return $false
            }
        }
    }
    return $true
}

Function Test-Z60Asociatividad {
    for ($a = 0; $a -lt 60; $a++) {
        for ($b = 0; $b -lt 60; $b++) {
            for ($c = 0; $c -lt 60; $c++) {
                $izq = Get-Z60Mul (Get-Z60Mul $a $b) $c
                $der = Get-Z60Mul $a (Get-Z60Mul $b $c)

                if ($izq -ne $der) {
                    return $false
                }
            }
        }
    }
    return $true
}

Function Get-Z60Identidad {
    for ($e = 0; $e -lt 60; $e++) {
        $esIdentidad = $true

        for ($a = 0; $a -lt 60; $a++) {
            if ((Get-Z60Mul $a $e) -ne $a) {
                $esIdentidad = $false
                break
            }
        }

        if ($esIdentidad) { return $e }
    }

    return $null
}

Function Get-Z60Absorbentes {
    $absorbentes = @()

    for ($z = 0; $z -lt 60; $z++) {
        $esAbsorbente = $true

        for ($a = 0; $a -lt 60; $a++) {
            if ((Get-Z60Mul $a $z) -ne $z) {
                $esAbsorbente = $false
                break
            }
        }

        if ($esAbsorbente) {
            $absorbentes += $z
        }
    }

    return $absorbentes
}

Function Get-Z60Idempotentes {
    $idempotentes = @()

    for ($a = 0; $a -lt 60; $a++) {
        if ((Get-Z60Mul $a $a) -eq $a) {
            $idempotentes += $a
        }
    }

    return $idempotentes
}

Function Get-Z60Invertibles {
    $invertibles = @()
    $identidad = Get-Z60Identidad

    for ($a = 0; $a -lt 60; $a++) {
        for ($b = 0; $b -lt 60; $b++) {
            if ((Get-Z60Mul $a $b) -eq $identidad) {
                $invertibles += [PSCustomObject]@{
                    Elemento = $a
                    Inverso  = $b
                }
                break
            }
        }
    }

    return $invertibles
}

Function Get-Z60Ciclo {
    param([byte]$Semilla)

    $vistos = @{}
    $secuencia = @()
    $actual = $Semilla

    while (-not $vistos.ContainsKey($actual)) {
        $vistos[$actual] = $true
        $secuencia += $actual
        $actual = Get-Z60Mul $actual $Semilla
    }

    return $secuencia
}

Function Show-Z60Properties {
    Write-Host "`n📐 PROPIEDADES ALGEBRAICAS DE Z60" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan

    Write-Host "Conmutativa : $(Test-Z60Conmutatividad)" -ForegroundColor White
    Write-Host "Asociativa  : $(Test-Z60Asociatividad)" -ForegroundColor White
    Write-Host "Identidad   : $(Get-Z60Identidad)" -ForegroundColor Yellow
    Write-Host "Absorbentes : $((Get-Z60Absorbentes) -join ', ')" -ForegroundColor Yellow
    Write-Host "Idempotentes: $((Get-Z60Idempotentes) -join ', ')" -ForegroundColor Green

    $inv = Get-Z60Invertibles | Select-Object -First 10
    Write-Host "`nPrimeros invertibles:" -ForegroundColor Magenta
    $inv | Format-Table Elemento, Inverso -AutoSize
}

Show-Z60Properties