$Source = "C:\Users\Dell 7430\Desktop\TestSource"
$DestinationBase = "C:\Users\Dell 7430\Desktop\TestBackup"

if (-not (Test-Path -Path $DestinationBase)) {
    New-Item -ItemType Directory -Path $DestinationBase | Out-Null
}

$DateDuJour = Get-Date -Format "yyyy-MM-dd"
$CheminZip = "$DestinationBase\Backup_$DateDuJour.zip"

Compress-Archive -Path "$Source\*" -DestinationPath $CheminZip -Force
Write-Host "Sauvegarde compressée directement dans : $CheminZip"