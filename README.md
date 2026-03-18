# 🚀 NexusSync | Cloud Backup & Hybrid Synchronization Solution

## 🔄 Pipeline de Synchronisation

<p align="center">
  <img src="./Cloud Nexus Synchronisation/assets/Pipeline_ projet.png" alt="NexusSync Banner" width="100%">
</p>

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Backend-Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![SQLite](https://img.shields.io/badge/Local_DB-SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)

---

## 📌 Présentation

**NexusSync** est une application mobile cross-platform développée avec **Flutter**, permettant aux utilisateurs de :

- Sauvegarder leurs **contacts, SMS et favoris**
- Restaurer leurs données depuis le cloud
- Synchroniser automatiquement leurs données entre plusieurs appareils

Chaque utilisateur est identifié via son **compte Google**, garantissant une gestion sécurisée et personnalisée des données :contentReference[oaicite:1]{index=1}.

---

## 🎯 Objectif du Projet

Ce projet a été réalisé dans le cadre du module **Programmation Mobile (ESISA - 2025)**.

L'objectif principal est de concevoir une solution permettant :
- La **continuité des données mobiles**
- Une **synchronisation intelligente (Delta Sync)**
- Une **expérience utilisateur fluide et intuitive**

---

## 🧠 Concept Clé : Architecture Hybride

NexusSync utilise une architecture **hybride combinant local + cloud** :

| Composant | Rôle |
|----------|------|
| SQLite | Stockage local rapide (favoris, stats appels/SMS) |
| Firebase Realtime Database | Synchronisation cloud |
| Google Auth | Authentification sécurisée |
| Flutter | Interface utilisateur cross-platform |

---

## 🔄 Pipeline de Synchronisation

Le fonctionnement global du système :

1. 📱 Données récupérées depuis le téléphone (SMS, Contacts)
2. 💾 Stockage local dans SQLite (favoris & statistiques)
3. ⚙️ Traitement via logique de synchronisation (Delta Sync + timestamps)
4. ☁️ Envoi vers Firebase (backup sécurisé)
5. 🔁 Restauration multi-appareils via authentification utilisateur

---

## 🛠️ Stack Technique

- **Flutter** → UI performante et cross-platform
- **Firebase Authentication** → Auth Google
- **Firebase Realtime Database / Firestore** → stockage cloud
- **SQLite** → base locale embarquée

---

## 🚀 Fonctionnalités Clés

### 🔐 Authentification
- Connexion via compte Google
- Isolation des données par utilisateur

### 🔄 Synchronisation Intelligente
- Synchronisation basée sur **timestamp**
- Envoi uniquement des données modifiées (**Delta Sync**)

### 📱 Gestion des Données

#### 📇 Contacts
- Nom complet
- Photo
- Emails
- Date de création
- Ajout aux favoris

#### 💬 SMS
- Regroupés par contact
- Aperçu des messages
- Affichage détaillé au clic

#### ⭐ Favoris
- Basé sur :
  - Nombre d’appels
  - Nombre de SMS
- Ou sélection manuelle
- Actions rapides :
  - Appel
  - Envoi SMS

---

## 🏗️ Architecture des Données

### 📍 Local (SQLite)
- Favoris
- Statistiques appels/SMS

### ☁️ Cloud (Firebase)

Structure des données :

```json
{
  "user_email": {
    "contacts": { ... },
    "sms": { ... },
    "favoris": { ... }
  }
}