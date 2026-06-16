# 👻 HyperV

| #️⃣ | Participations |
|-|-|
| 1️⃣ | [:tada: Participation](.scripts/Participation-group1.md) |
| 2️⃣ | [:tada: Participation](.scripts/Participation-group2.md) |
| 3️⃣ | [:tada: Participation](.scripts/Participation-group3.md) |
| 4️⃣ | [:tada: Participation](.scripts/Participation-group4.md) |
|    | [:tada: Participation](.scripts/Participation-group5.md) |


## 🗄️ Rack 2️⃣ - 📇 42U

| Rack | U#️⃣| 🏙️ Serveurs | 🏷️  | S/N #️⃣        | Host IP                    | RAM  | CPU | HD      | Comments                             |
| ---- | -:| ------------| --- | ------------ | --------------------------- | ---: | ---:| ------- | ------------------------------------ |
| 2️⃣   | 27 | 🅰️ G6️⃣      | S19 | MXQ00309PP✅ | 10.7.237.7                  | 64GB | 16  | 273.4G  |   
| 2️⃣   | 26 | 🅰️ G6️⃣      | S39 | USE025N7B5✅ | 10.7.237.35                 | 64GB | 16  | 273.4G  | 🚨 $\color{red}RAM-P2(1)$
| 2️⃣   | 25 | 🅰️ G6️⃣      | S25 | MXQ016001V✅ | 10.7.237.24                 | 64GB | 16  | 273.4G  |   
| 2️⃣   | 24 | 🅰️ G6️⃣      | S13 | MXQ0030BLP✅ | 10.7.237.28                 | 64GB | 16  | 273.4G  | ➿ Switch HDDs+Cache from MXQ02302FC 


## 🧪 Tâche – Installation d'un disque NVMe

### 🎯 Situation

Un employeur veut créer un **mini data center à faible coût**.

Il a trouvé des serveurs **HP DL360 G6 à 150$** et te demande :

👉 **“Comment ajouter de l'expace disque sur Windows Server 2022 Datacenter ?”**

***

### ✅ Travail demandé

Propose une **méthode simple pour installer un disque NVMe 1TB sur les serveurs**. Créer un répertoire avec ton numéro d'étudiant :id: et décrit ses étapes dans ton fichier `README.md` avec les images que tu as prises pour argumenter tes recherches.

***

### ✅ Réponse attendue (format checklist)

```
1. Un serveur G6 a Windows Server 2022 Datacenter
   - Étape effectué dans le laboratoire précédent
   - Matériel assemblé

2. Installe le disque NVMe
   - Adaptateur PCIe/NVMe OK
   - NVMe 1TB OK

3. Formatte le disque NVMe
   - 1TB de disponible Ok

4. Permet l'acces à distance 
   - RDP OK
```

***

### ✅ Décision finale

```
INSTALLER ✅ si:
- Windows Server 2022 fonctionne
- Ethernet fonctionne
- disque installé

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


| |
|-|
| <image src=images/signal-2026-06-16-101528_004.jpeg width=50% height=50% > </image> |
| <image src=images/signal-2026-06-16-101528_002.jpeg width=50% height=50% > </image> |
| <image src=images/signal-2026-06-16-101528_003.jpeg width=50% height=50% > </image> |

# [NVMe](.prep/NVMe)

# [4.Windows ⚙️ 5-post-install (ultra-important-lab) ](https://github.com/CollegeBoreal/INF1092-201-E26-01/tree/main/4.Windows#%EF%B8%8F-5-post-install-ultra-important-lab)


