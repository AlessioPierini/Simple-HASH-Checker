# Richiedi la directory del file
$hahs1 = Read-Host -Prompt 'Direcotry File 1'
$hahs2 = Read-Host -Prompt 'Direcotry File 2'

# Ottieni gli hash dai file
$hashsourcefile = Get-FileHash $hahs1 -Algorithm SHA256 | Select-Object -ExpandProperty Hash
$hashdestfile = Get-FileHash $hahs2 -Algorithm SHA256 | Select-Object -ExpandProperty Hash

# Compara gli hash
if ($hashsourcefile -eq $hashdestfile) {
Start-Transcript -Path C:\Output.txt
Write-Host "Gli hash:

$hashsourcefile
$hashdestfile 

Risultano uguali,il file non è stato modificato" -ForegroundColor Green
Stop-Transcript


} else {
Start-Transcript -Path  C:\Output.txt
Write-Host "Gli hash:

$hashsourcefile
$hashdestfile 

Risultano differenti,il file è stato modificato" -ForegroundColor Red
Stop-Transcript
}