# Demander à l'utilisateur d'entrer le nom du dossier à analyser
# On vérifie si le chemin est valide
do {
    $chemin = Read-Host "Veuillez entrer le chemin du dossier "
    if (-not (Test-Path -Path $chemin)) 
        {
        Write-Host "Le chemin n'existe pas. Veuillez réessayer." -ForegroundColor Red
        }
    } 
while (-not (Test-Path -Path $chemin))

Write-Host "Analyse du contenu du dossier : $chemin" -ForegroundColor Green

# On recherche les fichiers de plus de 200MB

$Fichiers = Get-ChildItem -Path $chemin -Recurse | Where-Object { $_.Length -gt 200MB }

# Afficher les fichiers trouvés
if ($Fichiers.Count -eq 0) 
    {
    Write-Host "Aucun fichier de plus de 200MB trouvé dans le dossier." -ForegroundColor Yellow
    }
else
    {
    Write-Host "Fichiers de plus de 200MB trouvés :" -ForegroundColor Green
    #$Fichiers | ForEach-Object { Write-Host $_.Name }
    $Fichiers | Select-Object Name, @{Name="Taille en MB";Expression={[math]::round($_.Length / 1MB, 2)}} | Format-Table -AutoSize
    }



# Version en tableau par Copilot

#    Write-Host "Fichiers de plus de 200MB trouvés :" -ForegroundColor Green

#    $Fichiers | ForEach-Object{
#          $sizeMB = [math]::Round($_.Length / 1MB, 2)
#          [PSCustomObject]@{
#          Nom  = $_.Name
#          Poids_MB = $sizeMB
#          }| Format-Table -AutoSize
#          }
#   }

pause