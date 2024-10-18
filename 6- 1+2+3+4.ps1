# Saisie du nombre par l'utilisateur
[Int]$Nb = Read-Host " Veuillez entrer votre nombre"
Write-Host "`n`tCalcul en cours ... " -ForegroundColor Yellow

# On fait une liste qui comprend tout les nombres
$Liste = @()

For ($i=1;$i -le $Nb;$i++)
    {
    $Liste += $i
    }

# On additionne les éléments de la liste
$Somme = 0
foreach ($item in $Liste)
    {
$Somme += $item
    }
# On affiche le résultat
Write-Host " $($Liste -join "+") = $($somme)`n" -ForegroundColor Gray
Write-Host "Le résutat de l'addition des nombres de 1 à $Nb est égale à : $($somme)`n" -ForegroundColor Green
pause
cls