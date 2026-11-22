# Définition des dossiers source et destination
$Source = "$env:USERPROFILE\Desktop\TestSource"
$Destination = "$env:USERPROFILE\Desktop\TestBackup"

# Création automatique des dossiers s'ils n'existent pas (pour faciliter vos tests)
if (-not (Test-Path -Path $Source)) { New-Item -ItemType Directory -Path $Source | Out-Null }
if (-not (Test-Path -Path $Destination)) { New-Item -ItemType Directory -Path $Destination | Out-Null }

# Copie des fichiers
Copy-Item -Path "$Source\*" -Destination $Destination -Recurse -Force

Write-Host "Sauvegarde terminée !"
