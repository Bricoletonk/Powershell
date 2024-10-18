# Le formateur doit saisir le nombre de cote qu'il veut analyser

Write-Host "Bonjour Formateur,"
[Int] $QCotes = Read-Host "Veuillez renseigner le nombre de cotes à analyser"

# On crée un tableau pour saisir les cotes

$Tableau = @()
$Cote = 0
# On demande à l'utilisateur de saisir toutes les cotes
For ($i=1;$i -le $QCotes;$i++)
    {
    [Float] $Cote = Read-Host "Veuillez renseigner la cote du stagiaire $($i)"
     If ($Cote -lt 0)
        {
        Write-Host -NoNewLine " /" -BackgroundColor White -ForegroundColor Red
        Write-Host -NoNewline "!" -BackgroundColor White -ForegroundColor Black
        Write-Host -NoNewLine "`\ " -BackgroundColor White -ForegroundColor Red
        Write-Host -NoNewline " La cote doit être supérieure à zéro " -ForegroundColor Black -BackgroundColor White
        Write-Host -NoNewLine " /" -BackgroundColor White -ForegroundColor Red
        Write-Host -NoNewline "!" -BackgroundColor White -ForegroundColor Black
        Write-Host "`\ " -BackgroundColor White -ForegroundColor Red
        $Cote = Read-Host  "Veuillez saisir à nouveau la cote du stagiaire $($i)"
        }
     ElseIf ($Cote -gt 20)
        {
        Write-Host -NoNewLine " /" -BackgroundColor White -ForegroundColor Red
        Write-Host -NoNewline "!" -BackgroundColor White -ForegroundColor Black
        Write-Host -NoNewLine "`\ " -BackgroundColor White -ForegroundColor Red
        Write-Host -NoNewline " La cote doit être inférieur à vingt " -ForegroundColor Black -BackgroundColor White
        Write-Host -NoNewLine " /" -BackgroundColor White -ForegroundColor Red
        Write-Host -NoNewline "!" -BackgroundColor White -ForegroundColor Black
        Write-Host "`\ " -BackgroundColor White -ForegroundColor Red
        $Cote = Read-Host  "Veuillez saisir à nouveau la cote du stagiaire $($i)"
        }
     
    $Tableau += $Cote
    }

# On calcul la moyenne

$Somme = 0

foreach ($Cote in $Tableau)
        { 
        $Somme += $Cote 
        }
$MoyenneClasse = ($Somme/$QCotes)

$MoyenneArrondie = [Math]::Round($MoyenneClasse, 1)

Write-Host "`n La moyenne des cotes de la classe est de : $($MoyenneArrondie)/20" -ForegroundColor Yellow

# On trie le tableau pour obtenir la meilleure cote

$TriTableau = $Tableau | Sort-Object
$TopCote = $TriTableau[-1]
$BadCote = $TriTableau[0]

Write-Host "`n La meilleure cote de la classe est $($TopCote)/20" -ForegroundColor Green

Write-Host "`n La moins bonne cote de la classe est $($BadCote)/20" -ForegroundColor Red

$Tableau = 0
$Cote = 0