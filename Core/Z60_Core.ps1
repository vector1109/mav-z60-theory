# =========================================
# Z60 CORE ALGEBRAIC MODULE
# =========================================

function Invoke-Z60 {
    param(
        [int]$a,
        [int]$b
    )

    return ($a * $b) % 60
}

function Get-Z60Element {
    param([int]$x)

    return ($x % 60)
}

function Square-Z60 {
    param([int]$x)

    return ($x * $x) % 60
}

# --- Funciones Canónicas Añadidas ---

function Invoke-Z60Multiply {
    param(
        [int]$A,
        [int]$B
    )

    return ($A * $B) % 60
}

function Invoke-Z60Square {
    param(
        [int]$X
    )

    return ($X * $X) % 60
}

function Get-Z60Idempotents {

    return @(0,1,16,21,25,36,40,45)
}

function Get-Z60Orbit {

    param(
        [int]$X
    )

    $seen = @{}
    $orbit = @()

    while (-not $seen.ContainsKey($X)) {

        $seen[$X] = $true
        $orbit += $X

        $X = Invoke-Z60Square $X
    }

    return $orbit
}

function Get-Z60Graph {

    $graph = @{}

    for ($x = 0; $x -lt 60; $x++) {

        $graph[$x] = Invoke-Z60Square $x
    }

    return $graph
}

function Get-Z60Basins {

    return @{
        0  = 2
        1  = 16
        16 = 16
        21 = 8
        25 = 4
        36 = 8
        40 = 4
        45 = 2
    }
}

Write-Host "[OK] Z60 Core loaded with Canonical Functions" -ForegroundColor Green