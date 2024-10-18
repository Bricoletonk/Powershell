#On lance une boucle de vérification pour être sûr que le nombre saisie par l'utilisateur est compris entre 1 et 10
do {
#L'Utilisateur saisi son nombre
    Write-Host "Veuillez saisir un nombre entre 1 et 10"
    $nbre = [int] (Read-Host)
    #Avec [int] on s'assure que la variable contiendra un entier
        If($nbre -gt 10)
            {
              Write-Host "/!\ Le nombre est trop grand /!\" -ForegroundColor Red 
              #Si le nombre est supérieur à 10 on affiche un message d'erreur
            }
        Elseif($nbre -lt 1)
            { 
             Write-Host "/!\ Le nombre est trop petit /!\" -ForegroundColor Red 
              #Si le nombre est inférieur à 1 on affiche un message d'erreur
            }
    }
while ($nbre -lt 1 -or $nbre -gt 10)
#Fin de la boucle de vérification à partir du moment où le nombre est entre les bornes

#On commence à faire nos calculs
Write-Host "Voici la table de multiplication de $nbre :" -ForegroundColor Green
$multiplicateur = 0
    for ($multiplicateur=0;$multiplicateur -le 10;$multiplicateur++) #for incrémente de 1 les nombres de 1 jusque 10
        {
         $resultat=$multiplicateur*$nbre #calcul de la variable $resultat
         Write-Host "`t$($nbre) X $($multiplicateur) `t`t= $($resultat)" -foregroundcolor white #Affichage du contenu des trois varables, avec une mise en forme, répété pour chaque valeur de $multiplicateur
        }
  pause