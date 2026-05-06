# =========================
# Archivo: Z60_Export.ps1
# =========================

. "$PSScriptRoot\Z60_Arithmetic.ps1"

$ExportPath = Join-Path $PSScriptRoot "..\Data\Export"

if (-not (Test-Path $ExportPath)) {
    New-Item -ItemType Directory -Path $ExportPath | Out-Null
}

Function Export-Z60CSV {
    $csvPath = Join-Path $ExportPath "z60_table.csv"

    $rows = @()

    for ($a = 0; $a -lt 60; $a++) {
        $row = @()
        for ($b = 0; $b -lt 60; $b++) {
            $row += (Get-Z60Mul $a $b)
        }
        $rows += ($row -join ",")
    }

    Set-Content -Path $csvPath -Value $rows
    return $csvPath
}

Function Export-Z60Python {
    $pyPath = Join-Path $ExportPath "z60_table.py"

    $content = @()
    $content += "z60 = ["

    for ($a = 0; $a -lt 60; $a++) {
        $row = @()
        for ($b = 0; $b -lt 60; $b++) {
            $row += (Get-Z60Mul $a $b)
        }
        $content += "    " + ($row -join ", ") + ","
    }

    $content += "]"

    Set-Content -Path $pyPath -Value $content
    return $pyPath
}

Function Export-Z60JavaScript {
    $jsPath = Join-Path $ExportPath "z60_table.js"

    $content = @()
    $content += "const z60 = ["

    for ($a = 0; $a -lt 60; $a++) {
        $row = @()
        for ($b = 0; $b -lt 60; $b++) {
            $row += (Get-Z60Mul $a $b)
        }
        $content += "    " + ($row -join ", ") + ","
    }

    $content += "];"

    Set-Content -Path $jsPath -Value $content
    return $jsPath
}

Function Export-Z60C {
    $cPath = Join-Path $ExportPath "z60_table.h"

    $content = @()
    $content += "const unsigned char z60[3600] = {"

    $flat = @()

    for ($a = 0; $a -lt 60; $a++) {
        for ($b = 0; $b -lt 60; $b++) {
            $flat += (Get-Z60Mul $a $b)
        }
    }

    $content += "    " + ($flat -join ", ")
    $content += "};"

    Set-Content -Path $cPath -Value $content
    return $cPath
}

Function Show-Z60Export {
    Write-Host "`n📦 EXPORTANDO Z60" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan

    $csv = Export-Z60CSV
    $py  = Export-Z60Python
    $js  = Export-Z60JavaScript
    $c   = Export-Z60C

    Write-Host "[OK] CSV        -> $csv" -ForegroundColor Green
    Write-Host "[OK] Python     -> $py" -ForegroundColor Green
    Write-Host "[OK] JavaScript -> $js" -ForegroundColor Green
    Write-Host "[OK] C Header   -> $c" -ForegroundColor Green
}

Show-Z60Export