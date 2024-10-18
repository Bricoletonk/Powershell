# Saisie d'un nombre entier
$Nombre = [Int] (Read-Host " Veuillez entrer votre nombre : ")
Write-Host

# Liste des nombres pairs
$Paire = @()
# Boucle FOR
For ($i = $Nombre; $i -ge 0; $i--) 
    {
    if ($i % 2 -eq 0) #on cherche pour chaque nombre si il est divisible par 2, donc paire
        {
        $Paire += $i 
        }
    }

# Liste des nombres impairs
$Impaire = @()
# Boucle FOR
For ($i = $Nombre; $i -ge 0; $i--)
    {
    if ($i % 2 -ne 0) #on cherche pour chaque nombre si il est non divisible par 2, donc impaire
        {
        $Impaire += $i
        }
    }

# On affiche le résultat

Write-Host "Paire :"
Write-host ($Paire) -ForegroundColor Red

Write-Host 

Write-Host "Impaire :"
Write-host ($Impaire) -ForegroundColor Green
pause