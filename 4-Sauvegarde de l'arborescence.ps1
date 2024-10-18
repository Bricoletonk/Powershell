# Demander à l'utilisateur d'entrer le nom du dossier à sauvegarder
# On vérifie si le chemin est valide
do {
    $chemin = Read-Host "Veuillez entrer le chemin du dossier à sauvegarder"
    if (-not (Test-Path -Path $chemin)) 
        {
        Write-Host "Le chemin n'existe pas. Veuillez réessayer." -ForegroundColor Red
        }
    } 
while (-not (Test-Path -Path $chemin))

Write-Host "Sauvegarde du contenu du dossier : $chemin" -ForegroundColor Green

#On va sur le dossier de destination des sauvegarde

$Root = "D:\Save2\"

cd $Root

#On crée le dossier de sauvegarde quotidien

$Date = Get-Date -Format yyyy-MM-dd-HH-mm-ss
$NomDossier = "SAVE-$($Date)"

mkdir $NomDossier

$Sauvegarde = Join-Path -Path $Root -ChildPath $NomDossier

#On lance la copie vers le dossier de Sauvegarde
Copy-Item -Path $chemin -Destination $Sauvegarde -Recurse -Force

# Créer un fichier texte avec l'arborescence des dossiers et fichiers sauvegardés
tree $Sauvegarde /F /A > (Join-Path -Path $Sauvegarde -ChildPath "Arborescence.txt")

# Afficher l'arborescence à l'écran
Write-Host "Arborescence des dossiers et fichiers sauvegardés :"
tree $Sauvegarde /F /A

Write-Host "La sauvegarde a été effectuée avec succès dans le dossier : $Sauvegarde" -ForegroundColor Green
Write-Host "L'arborescence des dossiers et fichiers sauvegardés a été enregistrée dans : $Sauvegarde\Arborescence.txt" -ForegroundColor Green
cd c:
pause