# 🔐 Audit des comptes Active Directory

## 📌 Description

Ce projet consiste en un script PowerShell permettant d’auditer les comptes utilisateurs dans Active Directory afin d’identifier des risques de sécurité.

## 🎯 Objectifs

* Détecter les comptes inactifs
* Identifier les comptes dont le mot de passe n’expire jamais
* Fournir un rapport exploitable par l’équipe TI

## 🛠️ Technologies utilisées

* PowerShell
* Active Directory (Windows Server)

## ⚙️ Fonctionnement

Le script :

1. Récupère tous les utilisateurs Active Directory
2. Analyse :

   * la date de dernière connexion
   * les paramètres de mot de passe
3. Génère un fichier CSV contenant les résultats

## 📊 Résultat

Un fichier CSV est généré avec :

* Nom de l’utilisateur
* Dernière connexion
* Statut (actif/inactif)
* Paramètres de sécurité

## 🛡️ Importance en cybersécurité

Les comptes inactifs ou mal configurés représentent un risque majeur :

* comptes oubliés exploitables
* accès non contrôlés
* surface d’attaque augmentée

## 🚀 Améliorations possibles

* Génération d’un rapport HTML
* Détection des comptes administrateurs
* Intégration avec des alertes

