# 🏗️ Infrastructure

| #️⃣ | Participations | Vérifications |
|-|-|-| 
| 1️⃣ | [:tada: Participation](.scripts/Participation-group1.md) | [:checkered_flag: Vérification](.scripts/Check-group1.md) |
| 2️⃣ | [:tada: Participation](.scripts/Participation-group2.md) | [:checkered_flag: Vérification](.scripts/Check-group2.md) |
| 3️⃣ | [:tada: Participation](.scripts/Participation-group3.md) | [:checkered_flag: Vérification](.scripts/Check-group3.md) |
| 4️⃣ | [:tada: Participation](.scripts/Participation-group4.md) | [:checkered_flag: Vérification](.scripts/Check-group4.md) |
| 5️⃣ | [:tada: Participation](.scripts/Participation-group5.md) | [:checkered_flag: Vérification](.scripts/Check-group5.md) |
| 6️⃣ | [:tada: Participation](.scripts/Participation-group6.md) | [:checkered_flag: Vérification](.scripts/Check-group6.md) |
| 7️⃣ | [:tada: Participation](.scripts/Participation-group7.md) | [:checkered_flag: Vérification](.scripts/Check-group7.md) |
| 8️⃣ | [:tada: Participation](.scripts/Participation-group8.md) | [:checkered_flag: Vérification](.scripts/Check-group8.md) |

## 🗄️ Rack 2️⃣ - 📇 42U

| Rack | U#️⃣| 🏙️ Serveurs | 🏷️  | S/N #️⃣     | Host IP                                 | RAM  | CPU | HD      | Operating Systems      | Services                           |
| ---- | -:| ------------| --- | --------- | ---------------------------------------  | ---: | ---:| ------- | ---------------------- | ---------------------------------- |
| 2️⃣   |    |
| 2️⃣   | 34 | 🅰️ G6️⃣      | S18 | MXQ9410AFZ | 10.7.237.22                             | 64GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 33 | 🅰️ G6️⃣      | S19 | MXQ00309PP | 10.7.237.7                              | 64GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 32 | 🅰️ G6️⃣      | S37 | MXQ01105H4 | 10.7.237.13                             | 64GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 31 | 🅰️ G6️⃣      | S39 | USE025N7B5 | 10.7.237.35                             | 64GB | 16  | 273.4G  | 🪟 2022 DC 🚨 $\color{red}RAM-P2G$ [1]       
| 2️⃣   |    |
| 2️⃣   | 28 | 🅰️ G6️⃣      | S21 | MXQ0390BMX | 10.7.237.19                             | 64GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 27 | 🅰️ G6️⃣      | S25 | MXQ016001V | 10.7.237.24                             | 64GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 25 | 🅰️ G6️⃣      | S17 | MXQ02302FC | 10.7.237.28                             | 64GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 26 | 🅰️ G6️⃣      | S27 | USE928N320 | 10.7.237.34                             | 64GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   |    |

***

# 🧪 Infrastructure à Compléter d’un serveur (DL360 G6)

## 🧪 Tâche – Vérification serveur (DL360 G6)

### 🎯 Situation

Un employeur veut créer un **mini data center à faible coût**.

Il a trouvé des serveurs **HP DL360 G6 à 150$** et te demande :

👉 **“Comment vérifier qu’ils fonctionnent correctement AVANT de les acheter ?”**

***

### ✅ Travail demandé

Propose une **méthode simple pour tester les serveurs**.

***

### ✅ Réponse attendue (format checklist)

```
1. Inspection physique
   - état général
   - ventilateurs OK

2. Démarrage
   - boot OK
   - BIOS accessible

3. Matériel
   - CPU / RAM détectés
   - disques présents

4. RAID (important)
   - status = OK
   - aucun disque failed

5. Disques
   - santé (SMART OK)

6. Diagnostic
   - test RAM / CPU
   - pas d’erreur

7. Alimentation
   - PSU1 + PSU2 OK

8. Réseau
   - ports fonctionnels
```

***

### ✅ Décision finale

```
ACHETER ✅ si:
- tout fonctionne
- RAID sain
- aucun error

REFUSER ❌ si:
- disque ou RAID FAIL
- erreur RAM
- serveur instable
```

***

### ⚡ Résumé ultra rapide

```
BOOT → RAID → DISK → RAM → OK = acheter ✅
```

***

## 🎯 Objectif

Comprendre :

* les composants d’un serveur
* l’assemblage logique
* le RAID
* l’utilisation en virtualisation

***

# 🧩 PARTIE 1 — Identification des composants ✅

### ✅ Réponses attendues

| Composant              | Rôle            | Présent? | Notes                  |
| ---------------------- | --------------- | -------- | ---------------------- |
| CPU (Xeon)             | Traitement      | ✅        | 2 sockets, multi‑cœurs |
| RAM ECC DDR3           | Mémoire         | ✅        | Jusqu’à 192GB          |
| Carte mère             | Interconnexion  | ✅        | Support Xeon 5500/5600 |
| RAID P410i             | Gestion disques | ✅        | RAID matériel          |
| Disques (SAS/SATA/SSD) | Stockage        | ✅        | 4 baies                |
| PSU (2x)               | Alimentation    | ✅        | Redondance             |
| NIC                    | Réseau          | ✅        | 2 × 1Gb                |
| Ventilateurs           | Refroidissement | ✅        | Obligatoire            |

💡 Tous ces éléments forment l’architecture standard d’un serveur (CPU, RAM, stockage, réseau, alimentation) [\[szwecent.com\]](https://www.szwecent.com/what-are-the-essential-components-of-a-server/)

***

# ⚙️ PARTIE 2 — Assemblage logique ✅

### ✅ Ordre correct

```
1. Installer CPU #1 et CPU #2
2. Installer RAM (équilibrée par CPU)
3. Installer contrôleur RAID (déjà intégré ici)
4. Insérer les disques dans les baies
5. Vérifier les ventilateurs
6. Brancher les alimentations (PSU1 + PSU2)
7. Fermer le châssis
8. Installer dans le rack (1U)
```

💡 Un serveur rack 1U est compact → airflow critique, densité élevée [\[clrn.org\]](https://www.clrn.org/how-to-build-a-rack-mount-server/)

***

# 💾 PARTIE 3 — RAID ✅

### ✅ Réponses

**Q1 — RAID recommandé :**
👉 RAID 1

**Pourquoi :**

* Redondance (miroir)
* Sécurité des données

**Q2 — Si 1 disque tombe :**
👉 Le serveur CONTINUE de fonctionner

***

### ⚠️ Alternatif

| RAID   | Avantage    | Inconvénient                   |
| ------ | ----------- | ------------------------------ |
| RAID 0 | Performance | Perte totale si 1 disque meurt |
| RAID 1 | Sécurité ✅  | 50% capacité perdue            |
| RAID 5 | Sécurité ✅  | 50% capacité perdue            |

💡 Le contrôleur P410i supporte plusieurs niveaux RAID matériel [\[hpe.com\]](https://www.hpe.com/psnow/downloadDoc/HP%20ProLiant%20DL360%20Generation%206%20%28G6%29-c04284365.pdf?id=c04284365&isFutureVersion=true&ver=11&form=false&preview=false&servePdfFile=true&hf=slim&isLinearized=false&contentDisposition=attachment)


Parfait — ça devient **beaucoup plus intéressant pour ton lab** 👍  
👉 Avec **3 disques SAS 10K**, on corrige la partie RAID.

***

# PARTIE 3 — RAID ✅

### ✅ Réponses

**RAID recommandé :**
👉 **RAID 5**

***

## 📊 Explication simple (réponse modèle)

```
RAID 5 est adapté car :
- nécessite minimum 3 disques ✅
- offre tolérance à la panne (1 disque peut tomber)
- optimise l’espace disque (pas 50% perdu comme RAID 1)
```

***

### ⚠️ Comportement en cas de panne

👉 Si **1 disque tombe** :

```
- le serveur continue de fonctionner ✅
- performance réduite ❌
- reconstruction nécessaire après remplacement
```

***

### 📦 Comparaison mise à jour (important pour examen)

| RAID    | Disques requis | Tolérance panne | Capacité utile |
| ------- | -------------- | --------------- | -------------- |
| RAID 0  | 2+             | ❌               | 100%           |
| RAID 1  | 2              | ✅ 1 disque      | 50%            |
| RAID 5  | 3+ ✅           | ✅ 1 disque      | \~66%          |
| RAID 10 | 4+             | ✅               | 50%            |

💡 RAID 5 utilise une **parité distribuée** pour reconstruire les données [\[hpe.com\]](https://www.hpe.com/psnow/downloadDoc/HP%20ProLiant%20DL360%20Generation%206%20%28G6%29-c04284365.pdf?id=c04284365&isFutureVersion=true&ver=11&form=false&preview=false&servePdfFile=true&hf=slim&isLinearized=false&contentDisposition=attachment)

### ✅ Version ultra-courte (cheat sheet étudiants)

```
3 disques = RAID 5 ✅
Tolère 1 panne ✅
Capacité ≈ 66%
```

***

# 🌐 PARTIE 4 — Virtualisation ✅

### ✅ Réponses attendues

**Q1 — Pourquoi bon pour virtualisation?**

* 2 CPU → multi‑VM
* Beaucoup de RAM
* RAID → fiabilité
* 2 NIC → segmentation réseau

**Q2 — OS possible :**

* VMware ESXi ✅
* Proxmox ✅
* Windows Server ✅
* Linux ✅

***

# 🧠 PARTIE 5 — Contraintes ✅

### ✅ Réponses obligatoires

| Limitation  | Explication            |
| ----------- | ---------------------- |
| Pas UEFI    | Boot legacy uniquement |
| CPU ancien  | Performance limitée    |
| DDR3        | Pas optimal vs DDR4/5  |
| RAID ancien | Moins flexible         |
| 1Gb réseau  | Goulot possible        |

***

# ✅ Version ultra-courte (cheat sheet étudiants)

```
CPU = traitement
RAM = mémoire
RAID = sécurité ou performance
NIC = réseau
PSU = alimentation

RAID1 = recommandé ✅

DL360 G6:
- ancien hardware
- pas UEFI
- bon pour lab virtualisation
```
