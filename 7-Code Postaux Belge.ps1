# On demande au script de chercher le .CSV dans le même dossier que le script lui-même
$DossierScript = $PSScriptRoot
$CSV = Join-Path -Path $DossierScript -ChildPath "code-postaux-belge.csv"
$DataCSV = Import-Csv -Path $CSV -Delimiter ";"

# Afficher le chemin du dossier du script et du fichier CSV
#Write-Host "Dossier du script : $DossierScript"
#Write-Host "Chemin du fichier CSV : $CSV"

# Saisie de la commune
[Int]$CodePostal = Read-Host " Veuillez entrer le code postal de votre commune"

#Rercherche dans le fichier .CSV
$Commune = $DataCSV | Where-Object { $_.Code -eq $CodePostal }

#Résultat
if ($Commune) 
        {
        Write-Host "La/les communes répondant au code postal $CodePostal est/sont : $($Commune.Localite)" -ForegroundColor Green
        }
else    {
        Write-Host "Aucune commune trouvée pour le code postal $CodePostal" -ForegroundColor Red
        }
pause