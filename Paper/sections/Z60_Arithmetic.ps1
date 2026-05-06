# =========================
# Archivo: Z60_Arithmetic.ps1
# =========================

Function Build-Z60-Tables {
    $LUT = New-Object byte[] 3600

    for ($i = 0; $i -lt 60; $i++) {
        for ($j = 0; $j -lt 60; $j++) {
            $idx = ($i * 60) + $j
            $LUT[$idx] = [byte](($i * $j) % 60)
        }
    }

    return $LUT
}

Function Get-Z60Mul {
    param(
        [byte]$A,
        [byte]$B
    )

    $idx = ($A * 60) + $B
    return [int]$Global:Z60_MUL[$idx]
}

Function ConvertTo-Z60Degrees {
    param([byte]$Phase)

    $degrees = $Phase * 6

    return [PSCustomObject]@{
        Degrees = [math]::Floor($degrees)
        Minutes = [math]::Round(($degrees - [math]::Floor($degrees)) * 60)
        Seconds = 0
    }
}

Function ConvertTo-Z60Angle {
    param([byte]$Phase)
    return $Phase * 6
}

Function Initialize-Z60 {
    if (-not $Global:Z60_MUL) {
        $Global:Z60_MUL = Build-Z60-Tables

        Write-Host "[OK] Tabla Z60 cargada (array plano 3600 posiciones)" -ForegroundColor Cyan
        Write-Host "    60 fases x 6° = 360° exactos" -ForegroundColor DarkCyan
    }
}

Initialize-Z60