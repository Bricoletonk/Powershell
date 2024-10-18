# Importer le fichier distant comprenant les utilisateurs à créer

# Je crée le chemin du CSV de manière à ce qu'il soit toujours à coté du script lui même
$DossierScript = $PSScriptRoot
$UserCSV = Join-Path -Path $DossierScript -ChildPath "Users.csv"
$DataCSV = Import-Csv -Path $UserCSV -Delimiter ";"

# Afficher le chemin du dossier du script et du fichier CSV
    # Write-Host "Dossier du script : $DossierScript"
    # Write-Host "Chemin du fichier CSV : $UserCSV"

# Afficher le contenu du CSV chargé
    #Write-Host "Contenu du fichier CSV :"
    #$DataCSV | ForEach-Object { Write-Host $_ }

#$UtilisateurLogin = ($UtilisateurPrenom).Substring(0,1) + "." + $UtilisateurNom -> Donne r.junius


# On fait une boucle pour créer chaque utilisateur un à un
foreach ($User in $DataCSV)
    {

    # On doit convertir le mot de passe en SecureString
    
    $VarUser = $User.Password #Attention passer par une sous-variable
    $SecurePassword = ConvertTo-SecureString $VarUser -AsPlainText -Force

    # On crée l'utilisateur avec un mot de passe temporaire
    New-LocalUser    -Name $User.Username `
                     -Password $SecurePassword `                     -FullName $User.FullName
    
    # On l'ajoute au groupe Utilisateur
    Add-LocalGroupMember    -Group "Test" `                            -Member $User.Username

    # On configure les paramètres de l'utilisateur
    Set-LocalUser    -Name $User.Username `                     -PasswordNeverExpires $true `                     -UserMayChangePassword $true

    }