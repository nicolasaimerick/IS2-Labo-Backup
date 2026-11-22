$Source = "C:\Users\Dell 7430\Desktop\TestSource"
$DestinationBase = "C:\Users\Dell 7430\Desktop\TestBackup"

if (-not (Test-Path -Path $DestinationBase)) {
    New-Item -ItemType Directory -Path $DestinationBase | Out-Null
}

$DateDuJour = Get-Date -Format "yyyy-MM-dd"
$DateHeureExacte = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$NombreFichiers = (Get-ChildItem -Path $Source -File -Recurse).Count
$CheminZip = "$DestinationBase\Backup_$DateDuJour.zip"

Compress-Archive -Path "$Source\*" -DestinationPath $CheminZip -Force

$FichierLog = "$DestinationBase\historique.txt"
$LigneJournal = "[$DateHeureExacte] Sauvegarde réussie : $NombreFichiers fichier(s) compressé(s) dans Backup_$DateDuJour.zip"
Add-Content -Path $FichierLog -Value $LigneJournal

Write-Host "Sauvegarde terminée ! Le journal a été mis à jour dans : $FichierLog"