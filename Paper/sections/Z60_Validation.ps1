# =========================
# Archivo: Z60_Validation.ps1
# =========================

. "$PSScriptRoot\Z60_Arithmetic.ps1"
. "$PSScriptRoot\Z60_Properties.ps1"

Function Test-Z60LUTIntegrity {
    for ($a = 0; $a -lt 60; $a++) {
        for ($b = 0; $b -lt 60; $b++) {
            $esperado = ($a * $b) % 60
            $real = Get-Z60Mul $a $b

            if ($real -ne $esperado) {
                return [PSCustomObject]@{
                    OK = $false
                    Error = "LUT inconsistente en ($a,$b): esperado=$esperado real=$real"
                }
            }
        }
    }

    return [PSCustomObject]@{
        OK = $true
        Error = $null
    }
}

Function Test-Z60Closure {
    for ($a = 0; $a -lt 60; $a++) {
        for ($b = 0; $b -lt 60; $b++) {
            $r = Get-Z60Mul $a $b
            if ($r -lt 0 -or $r -ge 60) {
                return [PSCustomObject]@{
                    OK = $false
                    Error = "Fuera de rango en ($a,$b): $r"
                }
            }
        }
    }

    return [PSCustomObject]@{
        OK = $true
        Error = $null
    }
}

Function Test-Z60Symmetry {
    for ($a = 0; $a -lt 60; $a++) {
        for ($b = 0; $b -lt 60; $b++) {
            if ((Get-Z60Mul $a $b) -ne (Get-Z60Mul $b $a)) {
                return [PSCustomObject]@{
                    OK = $false
                    Error = "No simétrica en ($a,$b)"
                }
            }
        }
    }

    return [PSCustomObject]@{
        OK = $true
        Error = $null
    }
}

Function Test-Z60Identity {
    $e = Get-Z60Identidad

    for ($a = 0; $a -lt 60; $a++) {
        if ((Get-Z60Mul $a $e) -ne $a) {
            return [PSCustomObject]@{
                OK = $false
                Error = "Identidad falla en $a"
            }
        }
    }

    return [PSCustomObject]@{
        OK = $true
        Error = $null
    }
}

Function Test-Z60Absorbent {
    $abs = Get-Z60Absorbentes

    foreach ($z in $abs) {
        for ($a = 0; $a -lt 60; $a++) {
            if ((Get-Z60Mul $a $z) -ne $z) {
                return [PSCustomObject]@{
                    OK = $false
                    Error = "Absorbente falla en z=$z con a=$a"
                }
            }
        }
    }

    return [PSCustomObject]@{
        OK = $true
        Error = $null
    }
}

Function Test-Z60Idempotents {
    $ids = Get-Z60Idempotentes

    foreach ($a in $ids) {
        if ((Get-Z60Mul $a $a) -ne $a) {
            return [PSCustomObject]@{
                OK = $false
                Error = "Idempotente inválido: $a"
            }
        }
    }

    return [PSCustomObject]@{
        OK = $true
        Error = $null
    }
}

Function Test-Z60Inverses {
    $e = Get-Z60Identidad
    $inv = Get-Z60Invertibles

    foreach ($par in $inv) {
        if ((Get-Z60Mul $par.Elemento $par.Inverso) -ne $e) {
            return [PSCustomObject]@{
                OK = $false
                Error = "Inverso inválido: $($par.Elemento) × $($par.Inverso)"
            }
        }
    }

    return [PSCustomObject]@{
        OK = $true
        Error = $null
    }
}

Function Show-Z60Validation {
    Write-Host "`n🧪 VALIDACIÓN FORMAL DE Z60" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan

    $tests = @(
        @{ Nombre = "Integridad LUT"; Test = (Test-Z60LUTIntegrity) }
        @{ Nombre = "Cierre";        Test = (Test-Z60Closure) }
        @{ Nombre = "Simetría";      Test = (Test-Z60Symmetry) }
        @{ Nombre = "Identidad";     Test = (Test-Z60Identity) }
        @{ Nombre = "Absorbente";    Test = (Test-Z60Absorbent) }
        @{ Nombre = "Idempotentes";  Test = (Test-Z60Idempotents) }
        @{ Nombre = "Invertibles";   Test = (Test-Z60Inverses) }
    )

    foreach ($t in $tests) {
        if ($t.Test.OK) {
            Write-Host ("[OK] " + $t.Nombre) -ForegroundColor Green
        }
        else {
            Write-Host ("[FAIL] " + $t.Nombre + " -> " + $t.Test.Error) -ForegroundColor Red
        }
    }
}

Show-Z60Validation