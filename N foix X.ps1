# Saisie du nombre N
[int] $N = Read-Host "Veuillez saisir votre multiplicateur" 
# On vérifie si c'est bien un nombre entier

# Saisie de X
[int] $X = Read-Host "Veuillez saisir votre nombre"
# On vérifie si c'est bien un nombre entier

# On fait une boucle pour y calculer toutes les valeurs de 1 à N
# Dans le tableau de résultat on a chaque valeur de N*X

$CptTableau = @()

For ($cpt=1;$cpt -le $N;$cpt++)
    {
    $mult = $cpt * $X
    $CptTableau += $mult
    }

# Résultat
$Affichage = $CptTableau[-1]

write-host "$CptTableau" -foregroundColor DarkGray
Write-Host "Le $($N) ème multiple de $($X) est : $($Affichage) ." -ForegroundColor Green 

[int] $pointeur = Read-host " Veuillez saisir la position pour laquelle vous voulez la valeur"
$pointeurtableau = $pointeur -1
$pointé = $CptTableau[$pointeurtableau]
write-host $pointé
pause
cls
