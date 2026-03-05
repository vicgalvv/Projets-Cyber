Import-Module GroupPolicy
Import-Module ActiveDirectory

$GPOName = "Bloquer_Panneau_Controle"
$DomainDN = (Get-ADDomain).DistinguishedName

# créer la GPO
$gpo = New-GPO -Name $GPOName

# attendre que AD enregistre la GPO
Start-Sleep -Seconds 3

# configurer la GPO
Set-GPRegistryValue `
-Name $GPOName `
-Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
-ValueName "NoControlPanel" `
-Type DWord `
-Value 1

# lier la GPO
New-GPLink `
-Guid $gpo.Id `
-Target $DomainDN `
-LinkEnabled Yes