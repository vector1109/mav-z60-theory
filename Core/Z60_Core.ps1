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

Write-Host "[OK] Z60 Core loaded" -ForegroundColor Green