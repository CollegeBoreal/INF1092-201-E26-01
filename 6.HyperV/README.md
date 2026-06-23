# 🧪 INF1092 – Création d’une VM (Hyper-V)

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
| 2️⃣   | 27 | 🅰️ G6️⃣      | S19 | MXQ00309PP✅ | 10.7.237.7                  | 64GB | 16  | 273.4G  | $\color{green}\text{1TBNVMe}$  $\color{red}\text{E:}$
| 2️⃣   | 26 | 🅰️ G6️⃣      | S39 | USE025N7B5✅ | 10.7.237.35                 | 64GB | 16  | 273.4G  | $\color{green}\text{1TBNVMe}$
| 2️⃣   | 25 | 🅰️ G6️⃣      | S25 | MXQ016001V✅ | 10.7.237.24                 | 64GB | 16  | 273.4G  |   
| 2️⃣   | 24 | 🅰️ G6️⃣      | S13 | MXQ0030BLP✅ | 10.7.237.28                 | 64GB | 16  | 273.4G  | $\color{green}\text{1TBNVMe}$

⚠️ Rajouter SSH au serveur [㊙️ SSH](.prep/SSH)

## 🎯 Objectif

Créer une machine virtuelle **Windows Server 2022** fonctionnelle avec Hyper‑V.

***

# ✅ 🟢 Étapes à suivre (copier/coller)

## 1. 📌 Variables (À MODIFIER) :id:

[📥 📀 Récupération du fichier ISO (OBLIGATOIRE)](README.md#--récupération-du-fichier-iso-obligatoire)

```powershell
$vm="VMXXXXXXX"   # 👉 Remplacer par TON numéro étudiant
$iso="D:\ISO\XXXXXXX\windows_server_2022.iso"  # 👉 Adapter chemin ISO
```

***

## 2. 🖥️ Création de la VM

```powershell
New-VM -Name $vm `
  -Generation 1 `
  -MemoryStartupBytes 4GB `
  -NewVHDPath "D:\VMs\$vm\$vm.vhdx" `
  -NewVHDSizeBytes 60GB `
  -SwitchName "External"
```

👉 Pourquoi GEN1 ?  
➡️ Plus stable sur les serveurs physiques (ex: G6 en laboratoire)

***

## 3. ⚙️ Configuration CPU

```powershell
Set-VMProcessor -VMName $vm -Count 2
```

***

## 4. 🧠 Configuration RAM

```powershell
Set-VMMemory -VMName $vm -DynamicMemoryEnabled $false
```

***

## 5. 💿 Monter l’ISO (OBLIGATOIRE)

```powershell
Set-VMDvdDrive -VMName $vm `
  -ControllerNumber 1 `
  -ControllerLocation 0 `
  -Path $iso
```

👉 Important :

* GEN1 = contrôleur IDE uniquement pour le DVD

***

## 6. ▶️ Démarrer la VM

```powershell
Start-VM -Name $vm
```

***

# 🔍 🟢 Vérification (OBLIGATOIRE)

```powershell
Get-VM -Name $vm
Get-VMMemory -VMName $vm
Get-VMProcessor -VMName $vm
Get-VMHardDiskDrive -VMName $vm
Get-VMNetworkAdapter -VMName $vm | Select VMName,SwitchName
```

***

# ⚠️ Points importants (à comprendre)

✅ Boot automatique sur ISO (pas besoin BIOS)  
✅ Switch réseau = **External**  
✅ Disque = **60GB minimum**  
✅ RAM fixe = **4GB recommandé**

***

# ❌ 🔴 Recommencer proprement (si erreur)

```powershell
Stop-VM -Name $vm -Force -ErrorAction SilentlyContinue
Remove-VM -Name $vm -Force -ErrorAction SilentlyContinue
Remove-Item "D:\VMs\$vm" -Recurse -Force -ErrorAction SilentlyContinue
```

***

## 🚀 Version ultra‑résumée (cheat sheet étudiant)

```powershell
$vm="VMXXXXXXX"
$iso="D:\ISO\XXXXXXX\win2022.iso"

New-VM -Name $vm -Generation 1 -MemoryStartupBytes 4GB `
  -NewVHDPath "D:\VMs\$vm\$vm.vhdx" -NewVHDSizeBytes 60GB `
  -SwitchName "External"

Set-VMProcessor -VMName $vm -Count 2
Set-VMMemory -VMName $vm -DynamicMemoryEnabled $false

Set-VMDvdDrive -VMName $vm -ControllerNumber 1 -ControllerLocation 0 -Path $iso

Start-VM -Name $vm
```

***

# 📥 📀 Récupération du fichier ISO (OBLIGATOIRE)

## ⚠️ IMPORTANT

Le fichier ISO **NE DOIT PAS être inventé ni copié d’un autre étudiant**.

👉 Il doit être téléchargé **personnellement** via le portail officiel :

## 🔵 Azure Education

<image src=images/Azure-Education-Win2022.png width=50% height=50% > </image>

***

## ✅ Étapes

1. Aller sur :
   👉 <https://portal.azure.com>

2. Se connecter avec votre compte scolaire

3. Aller dans :
   **Education → Software**

4. Rechercher :
   ```
   Windows Server 2022
   ```

5. Télécharger l’ISO

***

## 📁 Organisation recommandée (LAB)

Une fois téléchargé, placer le fichier :

```
D:\ISO\VOTRE_NUMERO_ETUDIANT\
```

Exemple :

```
D:\ISO\300098957\en-us_windows_server_2022_updated_july_2023_x64.iso
```

***

## ✅ Mise à jour variable PowerShell

```powershell
$vm="VM300098957"
$iso="D:\ISO\300098957\en-us_windows_server_2022_updated_july_2023_x64.iso"
```

***

## ❗ Erreurs fréquentes (à éviter)

❌ ISO manquant → la VM ne boot pas  
❌ Mauvais chemin → erreur "file not found"  
❌ ISO partagé entre étudiants → conflit / suppression  
❌ ISO sur C:\ → manque d’espace

***

## 🎯 Validation rapide

```powershell
Test-Path $iso
```

👉 Résultat attendu :

```
True
```

