$Source = "C:\Users\Dell 7430\Desktop\TestSource"
$DestinationBase = "C:\Users\Dell 7430\Desktop\TestBackup"

$DateDuJour = Get-Date -Format "yyyy-MM-dd"
$DestinationFinale = "$DestinationBase\Backup_$DateDuJour"

if (-not (Test-Path -Path $DestinationFinale)) {
    New-Item -ItemType Directory -Path $DestinationFinale | Out-Null
}

Copy-Item -Path "$Source\*" -Destination $DestinationFinale -Recurse -Force
Write-Host "Sauvegarde terminée dans le dossier : $DestinationFinale"