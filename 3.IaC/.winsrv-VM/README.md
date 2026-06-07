

✅ Matériel **G6 physique (pas UEFI)**  
👉 MAIS ici **ce n’est PAS ton serveur G6 qui boot…**

***

# ⚠️ 👉 Point clé (très important)

Ta capture montre clairement :

```
Microsoft Hyper‑V UEFI
```

👉 Donc :

```
Ce BIOS est celui de la VM (Hyper‑V Gen2)
→ PAS celui du serveur physique G6
```

***

# 🧠 Résumé simple

| Composant        | Type   |
| ---------------- | ------ |
| HP G6 (physique) | BIOS ✅ |
| Hyper‑V VM Gen2  | UEFI ✅ |

👉 La VM utilise **son propre firmware virtuel** → totalement indépendant du G6

***

# 😄 Pourquoi tu es bloqué malgré tout

Ton problème n’est PAS le BIOS/UEFI  
👉 c’est toujours :

```
DVD pas dans BootOrder
```

Et Hyper‑V Gen2 est parfois chiant avec ça (surtout en Core)

***

# ✅ ✅ ✅ Solution propre (simple et fiable)

👉 On arrête de se battre avec Gen2

## ✅ ✅ OPTION RECOMMANDÉE (100% stable)

👉 Recrée la VM en **Generation 1** (BIOS like)

***

## ✅ 🔧 Commande (copie exacte)

```powershell
New-VM -Name "WS2022-VM2" `
  -MemoryStartupBytes 4GB `
  -Generation 1 `
  -NewVHDPath "C:\VMs\WS2022-VM2.vhdx" `
  -NewVHDSizeBytes 60GB
```

***

## ✅ Ajouter ISO

```powershell
Set-VMDvdDrive -VMName "WS2022-VM2" `
  -Path "C:\Users\Administrator\en-us_windows_server_2022_updated_july_2023_x64_dvd_541692c3.iso"
```

***

## ✅ Démarrer

```powershell
Start-VM -Name "WS2022-VM2"
vmconnect localhost "WS2022-VM2"
```

***

# ✅ ✅ Résultat

👉 Direct :

```
Press any key to boot from CD/DVD...
```

✔ zéro bug  
✔ zéro UEFI weirdness  
✔ boot immédiat

***

# 🔥 Pourquoi c’est mieux (dans ton contexte)

Pour ton lab G6 + étudiants :

```
Generation 1 = simple / robuste / prévisible
Generation 2 = moderne MAIS fragile en CLI Hyper‑V Core
```

***

# ✅ TL;DR

```
G6 BIOS ✅
VM Gen2 = UEFI ⚠️ (c’est ça qui bloque)
→ recrée VM en Gen1 → boot ISO direct ✅
```

***

👉 Franchement : dans ton setup teaching, je recommande :

```
Gen1 pour labs
Gen2 pour démo avancée seulement
```

***

Si tu veux ensuite 👇  
👉 je peux te donner un script pour créer **28 VM prêtes à installer automatiquement pour tes étudiants** (genre ton Terraform mais en PowerShell pur 👍)
