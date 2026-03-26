# Import module Active Directory
Import-Module ActiveDirectory

# Date limite (90 jours)
$DateLimit = (Get-Date).AddDays(-90)

# Récupérer les utilisateurs actifs
$Users = Get-ADUser -Filter * -Property LastLogonDate, PasswordNeverExpires

# Résultats
$Report = foreach ($User in $Users) {
    [PSCustomObject]@{
        Name = $User.Name
        Username = $User.SamAccountName
        LastLogon = $User.LastLogonDate
        PasswordNeverExpires = $User.PasswordNeverExpires
        Inactive = ($User.LastLogonDate -lt $DateLimit)
    }
}

# Export CSV dans le fichier racine du code
$OutputPath = Join-Path $PSScriptRoot "Audit_AD_Users.csv"

$Report | Export-Csv $OutputPath -NoTypeInformation

Write-Host "Audit terminé. Fichier exporté dans : $OutputPath"

Write-Host "Audit termine. Fichier exporte."

