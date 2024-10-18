#Le garagiste
cls
$i=1
$NbStagiaire=0
Write-Host "Bonjour,"
While ($true) 
    {
    
    #On gère l'encodage d'une évaluation
    $s=1
    $TabCotes = @()
    
    Write-Host -NoNewLine "`nVeuillez entrer vos cotes pour l'évaluation $i puis "
    Write-Host -NoNewLine "Q" -ForegroundColor Red
    Write-Host " quand vous avez terminé"
    $Maximum = Read-Host "Quelle était la cote maximale possible pour cette évaluation ?"
    
    
    While ($true)
        {
        $Cote = Read-Host "`nVeuillez renseigner la cote du stagiaire n°$s ( ou Q pour arrêter la saisie)"
        If ($Cote -eq "Q")
            {
            break # On sort de la boucle
            } 
        Else 
            {
            
            # Essayer de convertir la cote en nombre flottant pour tester si le nombre est acceptable
            try {
                $CoteFloat = [float]$Cote
                If ($CoteFloat -gt $Maximum -or $CoteFloat -lt 0) 
                    {
                    Write-Host "La cote doit être comprise entre zéro et $($Maximum)" -ForegroundColor Red
                    }
                Else 
                    {
                     $TabCotes += $CoteFloat
                     $s ++
                    }
                } 
            catch
                {
                Write-Host "Veuillez entrer une valeur numérique valide" -ForegroundColor Red
                }
            
            }
        }

    #On fait les opérations demandées pour cette Evaluation
    $CoteMAX = $TabCotes | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum
    $CoteMIN = $TabCotes | Measure-Object -Minimum | Select-Object -ExpandProperty Minimum
    $EvaOK = $Maximum/2
    $StagiaireOK = ($TabCotes | Where-Object {$_ -ge $EvaOK}).Count

    #On ajoute le nombres de stagiaires à une variable pour calculer à la fin le revenu du garagiste
    $NbStagiaire += $TabCotes.Count

    # On affiche les résultat de cette évaluation
    Write-Host "`n----------------------------------------" -ForegroundColor Gray
    Write-Host "Évaluation n°$($i) terminée. Résultats :"
    Write-Host -NonewLine "Meilleure cote :"
    Write-Host " $([math]::Round($CoteMAX, 2))" -ForegroundColor Green
    Write-Host -NoNewline  "Pire cote :"
    Write-Host " $([math]::Round($CoteMIN, 2))"-ForegroundColor Yellow
    Write-Host "Nombre de stagiaires ayant réussi cette évaluation : $StagiaireOK" 
    Write-Host "----------------------------------------" -ForegroundColor Gray
    $Continue = Read-Host "Souhaitez-vous entrer une autre évaluation ? (O/N)"
    
    #On incrémente le numéro de l'évaluation
    $i++
    
    #On demande si il y a d'autres Evaluation en entrer
    If ($Continue -eq "N") 
        {
        break
        }
            
    }

$TauxChange = 0.92
$MontantCHF = $NbStagiaire * 80
$MontantEUR = $MontantCHF * $TauxChange
Write-Host "`n`n============================================================`n" -ForegroundColor Yellow
Write-Host "Toutes les évaluations sont terminées. Voici le récapitulatif :`n"
Write-Host "Nombre de Stagiaires notés : $NbStagiaire"
Write-Host -NoNewLine "Montant total pour le garagiste :" 
Write-Host " $MontantCHF CHF" -ForegroundColor Green
Write-Host "Montant total à payer par le centre de formation : $([math]::Round($MontantEUR, 2)) €"
Write-Host "`n============================================================" -ForegroundColor Yellow
pause