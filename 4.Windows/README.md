# 🪟 INF1092 — Installer Windows Server 2022 (Datacenter)

| #️⃣ | Participations |
|-|-|
| 1️⃣ | [:tada: Participation](.scripts/Participation-group1.md) |
| 2️⃣ | [:tada: Participation](.scripts/Participation-group2.md) |
| 3️⃣ | [:tada: Participation](.scripts/Participation-group3.md) |
| 4️⃣ | [:tada: Participation](.scripts/Participation-group4.md) |
| 5️⃣ | [:tada: Participation](.scripts/Participation-group5.md) |
| 6️⃣ | [:tada: Participation](.scripts/Participation-group6.md) |
| 7️⃣ | [:tada: Participation](.scripts/Participation-group7.md) |
| 8️⃣ | [:tada: Participation](.scripts/Participation-group8.md) |
| 9️⃣ | [:tada: Participation](.scripts/Participation-group9.md) |


## 🗄️ Rack 2️⃣ - 📇 42U

| Rack | U#️⃣| 🏙️ Serveurs | 🏷️  | S/N #️⃣        | Host IP                    | RAM  | CPU | HD      | Comments              |
| ---- | -:| ------------| --- | ------------ | --------------------------- | ---: | ---:| ------- | ----------------------- |
| 2️⃣   | 34 | 🅰️ G6️⃣      | S27 | USE928N320⚠️ | 10.7.237.34 | 64GB | 16  | 273.4G  | ⚠️ A installer 🚨 $\color{red}RAM-P2(6,9)$  |
| 2️⃣   | 33 | 🅰️ G6️⃣      | S19 | MXQ00309PP✅ | 10.7.237.7 | 64GB | 16  | 273.4G  | 🪟 2022 DC $\color{blue}\text{1TBNVMe}$ |
| 2️⃣   | 32 | 🅰️ G6️⃣      | S37 | MXQ01105H4❌ | 10.7.237.13 | 64GB | 16  | 273.4G  | ❌
| 2️⃣   | 31 | 🅰️ G6️⃣      | S39 | USE025N7B5⚠️ | 10.7.237.35 | 64GB | 16  | 273.4G  | 🪟 2022 DC 🚨 $\color{red}RAM-P2(1)$ [1] |
| 2️⃣   |    |
| 2️⃣   | 27 | 🅰️ G6️⃣      | S21 | MXQ0390BMX❌ | 10.7.237.19 | 64GB | 16  | 273.4G  | ❌
| 2️⃣   | 26 | 🅰️ G6️⃣      | S25 | MXQ016001V✅ | 10.7.237.24 | 64GB | 16  | 273.4G  | 🪟 2022 DC |
| 2️⃣   | 25 | 🅰️ G6️⃣      | S17 | MXQ02302FC⚠️ | 10.7.237.28 | 32GB ⚠️ | 16  | 273.4G  | 🪟 2022 DC 🚨 $\color{red}RAM-P2(3,6)$ |
| 2️⃣   | 24 | 🅰️ G6️⃣      | S13 | MXQ0030BLP✅ | [10.7.237.16](https://10.7.237.16:8006) | 64GB | 16  | 273.4G  | ⚠️ A installer  | 

***

## 🧪 Tâche – Installation de Windows Server 2022 DataCenter

### 🎯 Situation

Un employeur veut créer un **mini data center à faible coût**.

Il a trouvé des serveurs **HP DL360 G6 à 150$** et te demande :

👉 **“Comment installer Windows Server 2022 Datacenter ?”**

***

### ✅ Travail demandé

Propose une **méthode simple pour installer Windows Server sur les serveurs**. Créer un répertoire avec ton numéro d'étudiant :id: et décrit ses étapes dans ton fichier `README.md` avec les images que tu as prises pour argumenter tes recherches.

***

### ✅ Réponse attendue (format checklist)

```
1. Inspection physique
   - Étape effectué dans le laboratoire précédent
   - Matériel assemblé

2. Alimentation
   - PSU1 + PSU2 OK

3. Réseau
   - ports fonctionnels
```

***

### ✅ Décision finale

```
INSTALLER ✅ si:
- Windows Server 2022 fonctionne
- Ethernet fonctionne
- aucune erreur

REFUSER ❌ si:
- Installation non faite
- erreur RAM
- serveur instable
```

***

### ⚡ Résumé ultra rapide

```
BOOT → PXE → INSTALL = connecter à Windows ✅
```

***

| |
|-|
| <image src=images/signal-2026-06-16-101451_002.jpeg width=50% height=50% > </image> |
| <image src=images/signal-2026-06-16-101231_005.jpeg width=50% height=50% > </image>
| <image src=images/signal-2026-06-16-101231_003.jpeg width=50% height=50% > </image>
| <image src=images/signal-2026-06-16-101231_002.jpeg width=50% height=50% > </image>
| <image src=images/signal-2026-06-16-101231_006.jpeg width=50% height=50% > </image>
| <image src=images/signal-2026-06-16-101231_004.jpeg width=50% height=50% > </image>

## 🎯 Objectif

Comprendre :

* L'installation d'un serveur Windows
* la connection à l'internet
* L'accès à distance au serveur

***

## 🔍 1. Vérifications matériel AVANT installation

### 🚨 Symptôme critique

* Ventilateur (**fan**) tourne longtemps à plein régime → ⚠️ problème matériel

### ✅ Checklist rapide

* CPU(s) bien installés
* RAM bien insérée
* Carte **cache RAID** présente
* Disque(s) détecté(s)
* Écran VGA fonctionnel
* Clavier/USB connectés

***

## ⚡ 2. Méthodes d’installation

### 🌐 Option 1 — PXE (recommandé lab)

* Boot réseau (**F12 / PXE boot**)
* Serveur :
  ```
  pxe@labinfo.local
  ```
* Credentials :
  
  Boreal@20️⃣26️⃣
  
  
***

### 💾 Option 2 — Clé USB

* Insérer USB bootable
* Choisir **Boot Menu (F11 / F12 / ESC selon serveur)**

***

## 🧱 3. Installation Windows Server 2022

### Étapes essentielles (copier-coller mental)

1. Choisir :
   * **Windows Server 2022 Datacenter (Desktop Experience)** ✅

2. Langue :
   * Français (Canada) ou Anglais (selon lab)

3. Disk :
   * Sélectionner disque principal
   * ⚠️ Supprimer partitions existantes si nécessaire

4. Installation → attendre (≈ 10–20 min selon hardware)

***

## 🔐 4. Première connexion

* Définir mot de passe admin : `Administrator`
  ```
  Complexe obligatoire (doit être: Boreal@20️⃣26️⃣)
  ```

***

## ⚙️ 5. Post-install (ULTRA IMPORTANT lab)

### 1. Renommer serveur

```powershell
Rename-Computer SRV-XX -Restart
```

***

### 2. Configurer IP statique

```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 10.7.237.X -PrefixLength 23 -DefaultGateway 10.7.237.1
```

***

### 3. DNS

```powershell
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 10.7.237.3
```

***

### 4. Activer RDP

```powershell
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
```

***

## 🧪 6. Vérifications rapides

```powershell
hostname
ipconfig
ping 8.8.8.8
```

***

## 🚨 7. Problèmes fréquents (LAB)

| Problème        | Cause probable  | Fix                       |
| --------------- | --------------- | ------------------------- |
| PXE ne boot pas | VLAN / DHCP     | Vérifier réseau           |
| Disque absent   | RAID mal config | Vérifier BIOS/Smart Array |
| Fan 100%        | Hardware        | Vérifier RAM/CPU          |
| Pas réseau      | Driver NIC      | Installer driver          |

***

## 🧠 TL;DR (méga condensé étudiant)

```
1. Check hardware ✅
2. Boot PXE ou USB
3. Install Datacenter GUI
4. Delete partitions si besoin
5. Set admin password
6. Rename + IP + DNS
7. Enable RDP
```
