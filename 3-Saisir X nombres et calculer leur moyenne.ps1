##############################
# Saisir un range de nombres #
##############################

$Range = [int]
$Range = Read-Host ("Combien de valeurs sont à saisir aujourd'hui ?")

# On rentre les nombre un par un

$Nombres = @(0..$Range) #Variable $Nombres est un array (tableau) qui a une taille de $Range champs 

for ($i=1;$i -le $Range;$i++) #for incrémente de 1 les nombres de 1 jusque range
    {
    write-host "Entrez le nombre $i :" -ForegroundColor DarkGray 
    $nb = Read-Host
    $Nombres += $nb # on ajoute chaque nombre au tableau un par un
    }

#########################
# Calculer leur moyenne #
#########################

# calcul de la somme de deux éléments avec une boucle

for ($i=0;$i -lt $Range;$i++)
    {
    $Somme += $Nombres[$i]
    }

# On fait le calcul à proprement parler

$moyenne = ($Somme/$Range)

#Méthodes de calcul alternatives :

#(1)
#$Somme= 0
#foreach ($valeur in $Nombres) { $Somme += $valeur }
#$moyenne = ($Somme/$range)

#(2)
#$moyenne = ($Nombres | Measure-Object -Average).Average

Write-Host "La moyenne de votre série de $range nombres est $moyenne " -ForegroundColor Green
pause