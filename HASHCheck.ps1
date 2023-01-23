# Richiesta
$Title = "Estrattore HASH"
$Prompt = "Scegli se estrarre SHA256 o MD5"
$Choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&SHA256", "&MD5", "&Compara", "&Esci")
$Default = 1

# Prompt for the choice
$Choice = $host.UI.PromptForChoice($Title, $Prompt, $Choices, $Default)

# Azioni
switch($Choice)
{
    0 {
$dir1 = read-host "Inserisci la cartella dei file da controllare"
$dir2 = read-host "Insierisci la cartella dove salvare il file"  
Get-ChildItem -Path $dir1 -Recurse  | Get-FileHash | Export-Csv -Path $dir2\Results.csv -NoTypeInformation
}
    1 {
$dir1 = read-host "Inserisci la cartella dei file da controllare"
$dir2 = read-host "Insierisci la cartella dove salvare il file" 
Get-ChildItem -path $dir1 -Recurse | Get-FileHash -Algorithm MD5 | Export-Csv $dir2\Results.csv -NoTypeInformation


}
    2 { 
    $hahs1 = Read-Host -Prompt 'Direcotry File 1'
    $hahs2 = Read-Host -Prompt 'Direcotry File 2'
    $hashsourcefile = Get-FileHash $hahs1 -Algorithm SHA256 | Select-Object -ExpandProperty Hash
    $hashdestfile = Get-FileHash $hahs2 -Algorithm SHA256 | Select-Object -ExpandProperty Hash
    if ($hashsourcefile -eq $hashdestfile) {

Write-Host "Gli hash:
$hashsourcefile
$hashdestfile 
Risultano uguali,il file non è stato modificato" -ForegroundColor Green

} else {
Write-Host "Gli hash:
$hashsourcefile
$hashdestfile 
Risultano differenti,il file è stato modificato" -ForegroundColor Red
}
pause    
    }

    3 { Write-Host "Exit"}
}
