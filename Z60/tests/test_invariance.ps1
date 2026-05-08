# Φ invariance test

. ../Core/Z60_Core.ps1

$n = 60
$k = 2

foreach ($x in 0..59) {
    $fx = f $x $k $n
    if ((Phi $fx) -ne (Phi $x)) {
        throw "Φ invariance violated at $x"
    }
}

Write-Host "OK: Φ invariance holds"