#Ecrire un programme qui demande au formateur la liste des cotes d'une évaluation. 
#Le formatera entrera Q lorsqu'il aura entré toutes les cotes. 
#Le programme devra ensuite afficher : 
#Le pourcentage des côtes supérieures à dix
#Le pourcentage des côtes inférieures à dix
#Le pourcentage des côtes égales à dix. 
 
# On crée un tableau pour saisir les cotes

$TabCotes = @()
$Cote = ""

# On demande à l'utilisateur de saisir toutes les cotes

Write-Host "Bonjour,"
Write-Host -NoNewLine "Veuillez entrer vos Cotes puis "
Write-Host -NoNewLine "Q" -ForegroundColor Red
Write-Host " quand vous avez terminé"

While ($true) {
    $Cote = Read-Host "Veuillez renseigner la cote du stagiaire"
    If ($Cote -eq "Q") {
        break # On sort de la boucle
    } Else {
        # Essayer de convertir la cote en nombre flottant
        try {
            $CoteFloat = [float]$Cote
            If ($CoteFloat -gt 20 -or $CoteFloat -lt 0) {
                Write-Host "La cote doit être comprise entre zéro et vingt" -ForegroundColor Red
            } Else {
                $TabCotes += $CoteFloat
            }
        } catch {
            Write-Host "Veuillez entrer une valeur numérique valide" -ForegroundColor Red
        }
    }
}
#On compte combien de cotes ont été saisies

$QCotes = $TabCotes.Count
   
    If ($QCotes -eq 0) 
        {
        Write-Host "Il n'y a pas de cotes à compter"
        }
    Else
        {

Write-Host "Il y a $QCotes cotes saisies en tout" -ForegroundColor Gray
Write-Host "$TabCotes" -ForegroundColor Gray

# On calcul les différentes moyennes

        
        # Création des tableaux des cotes
        $TabSup = $TabCotes | Where-Object {$_ -gt 10}
        $TabDix = $TabCotes | Where-Object {$_ -eq 10}
        $TabInf = $TabCotes | Where-Object {$_ -lt 10}

        #On compte combien d'occurence supérieures à 10
        $CoteSup = $TabSup.Count
        
        #On compte combien d'occurence supérieures à 10
        $CoteDix = $TabDix.Count
        
        #On compte combien d'occurence supérieures à 10
        $CoteInf = $TabInf.Count

        #On calcul le pourcentage, si possible, des cotes supérieures à 10
If ($CoteSup -eq 0) 
    {
    Write-Host "Il n'y a pas de cotes supérieures à 10"
    }
Else
    {
    $PercSup = [Math]::Round( 100 * ($CoteSup / $QCotes), 2)
    Write-Host "`n$CoteSup cotes sont supérieures à 10" -ForegroundColor Gray
    Write-Host "$TabSup" -ForegroundColor Gray
    Write-Host -NoNewLine "`t Le pourcentage de cotes supérieures à 10 est de : "
    Write-Host "$($PercSup)%" -ForegroundColor Green
    }

#On calcul le pourcentage, si possible, des cotes égales à 10
If ($CoteDix -eq 0) 
    {
    Write-Host "Il n'y a pas de cotes strictement égales à 10"
    }
Else
    {
    $PercDix = [Math]::Round( 100 * ($CoteDix / $QCotes), 2) 
    Write-Host "`n$CoteDix cotes sont égales à 10" -ForegroundColor Gray
    #Write-Host "$TabDix" -ForegroundColor Gray
    Write-Host -NoNewLine "`t Le pourcentage de cotes égales à 10 est de : "
    Write-Host "$($PercDix)%" -ForegroundColor Yellow
    }
        
#On calcul le pourcentage, si possible, des cotes inférieures à 10
If ($CoteInf -eq 0) 
    {
    Write-Host "Il n'y a pas de cotes inférieures à 10"
    }
Else
    {
    $PercInf = [Math]::Round( 100 * ($CoteInf / $QCotes), 2)
    Write-Host "`n$CoteInf cotes sont inférieures à 10" -ForegroundColor Gray
    Write-Host "$TabInf" -ForegroundColor Gray
    Write-Host -NoNewLine "`t Le pourcentage de cote inférieures à 10 est de : "
    Write-Host "$($PercInf)%" -ForegroundColor Red
    }
}
