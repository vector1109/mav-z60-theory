$E = Get-Idempotents 60

$expected = @(0,1,16,21,25,36,40,45)

if ($E.Count -ne $expected.Count) {
    throw "Idempotent count mismatch"
}