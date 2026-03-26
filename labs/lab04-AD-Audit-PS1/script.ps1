<#
================================================================================
Nom du script  : AD-Audit-Users.ps1
Description    : Audit des comptes Active Directory afin d’identifier les comptes
                 inactifs et les configurations à risque (ex : mot de passe
                 n’expirant jamais).

Auteur         : Victor Galipeau
Date           : 2026-03-25
Version        : 1.0

Prérequis      :
- Module ActiveDirectory installé
- Droits de lecture sur Active Directory
- PowerShell 5.1 ou supérieur

Sortie         :
- Fichier CSV contenant les résultats de l’audit

Utilisation    :
- Exécuter le script dans un environnement membre du domaine
- Le fichier sera généré dans le même dossier que le script

================================================================================
#>

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

Write-Host "Audit terminé. Fichier exporte dans : $OutputPath"



