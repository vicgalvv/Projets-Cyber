# Lab 02 — Active Directory Home Lab

## Objectif

Créer un environnement Active Directory complet dans un laboratoire virtuel comprenant :

* Windows Server 2025
* Active Directory Domain Services (AD DS)
* DNS
* DHCP
* Client Windows 11 joint au domaine

Ce laboratoire simule une infrastructure d'entreprise afin de pratiquer l'administration et la configuration d'un domaine Windows.

---

## Environnement

Machines virtuelles utilisées :

* Windows Server 2025 (Domain Controller)
* Windows 11 (Client)

Réseau :

* Réseau interne / Host-Only

Nom du domaine :

technord.local

---

## Services installés

* Active Directory Domain Services
* DNS Server
* DHCP Server

---

## Étapes principales

1. Installation de Windows Server 2025
2. Installation du rôle Active Directory Domain Services
3. Promotion du serveur en Domain Controller
4. Configuration DNS
5. Configuration DHCP
6. Création d'utilisateurs dans Active Directory
7. Joindre un client Windows 11 au domaine

---

## Screenshots

### Server Manager

![Server Manager](screenshots/server-manager.png)

### Active Directory Users and Computers

![AD Users](screenshots/ad-users-computers.png)

### Configuration DNS

![DNS](screenshots/dns-config.png)

### Configuration DHCP

![DHCP](screenshots/dhcp-config.png)

### Client Windows 11 joint au domaine

![Client Domain](screenshots/client-domain-joined.png)

