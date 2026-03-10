# Architecture du Lab Active Directory

Ce laboratoire simule une infrastructure Active Directory simple.

## Machines virtuelles

Domain Controller
- OS : Windows Server 2025
- Roles : AD DS, DNS, DHCP
- IP : 192.168.100.254 (LAN pour connexions clients)
- IP : DHCP (WAN pour communication externe)

Client
- OS : Windows 11
- IP : DHCP

## Domaine

technord.local

## Réseau

Type : Host-Only

