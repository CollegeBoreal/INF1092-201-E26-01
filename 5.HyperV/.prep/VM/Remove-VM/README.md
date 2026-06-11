***

# ✅ ✅ 1. Supprimer la VM (PowerShell — recommandé)

👉 Commande simple (copier‑coller) :

```powershell
Remove-VM -Name "VM300098957" -Force
```

✔ Supprime la VM immédiatement (sans confirmation) [\[learn.microsoft.com\]](https://learn.microsoft.com/en-us/powershell/module/hyper-v/remove-vm?view=windowsserver2025-ps)

***

# ⚠️ Important (très souvent oublié)

👉 Cette commande :

✅ supprime :

* configuration VM
* snapshots

❌ NE supprime PAS :

* disque `.vhdx` [\[learn.microsoft.com\]](https://learn.microsoft.com/en-us/powershell/module/hyper-v/remove-vm?view=windowsserver2025-ps)

***

# ✅ ✅ 2. Supprimer aussi le disque (nettoyage complet)

👉 Sinon ton lab va vite remplir ton disque 😅

## 🔧 Trouver le chemin du disque

```powershell
Get-VMHardDiskDrive -VMName "VM300098957" | Select Path
```

***

## 🔧 Supprimer le disque

```powershell
Remove-Item "D:\VMs\VM300098957\VM300098957.vhdx" -Force
```

👉 ou supprimer tout le dossier :

```powershell
Remove-Item "D:\VMs\VM300098957" -Recurse -Force
```

***

# ✅ ✅ 3. Si la VM est encore en marche

```powershell
Stop-VM -Name "VM300098957" -Force
Remove-VM -Name "VM300098957" -Force
```

***

# ✅ ✅ Alternative GUI (rapide étudiant)

* Hyper‑V Manager
* clic droit VM → **Delete**
* confirmer

✔ mais encore une fois → disque reste sur le disque [\[bing.com\]](https://bing.com/search?q=how+to+delete+vm+hyper+v+manager+steps+delete+virtual+machine)

***

# 🚀 ✅ Version LAB (propre pour ton cours)

👉 delete complet en 1 bloc :

```powershell
$vm="VM300098957"

Stop-VM -Name $vm -Force -ErrorAction SilentlyContinue
$disk = Get-VMHardDiskDrive -VMName $vm | Select -Expand Path
Remove-VM -Name $vm -Force

if ($disk) {
    Remove-Item $disk -Force
}
```

***

# ⚡ TL;DR

👉 supprimer VM :

```powershell
Remove-VM -Name "VM300098957" -Force
```

👉 supprimer aussi disque :

```powershell
Remove-Item "chemin\vhdx" -Force
```

***

💡 Si tu veux, je peux te faire un script :
✅ “reset lab complet” (delete + recreate VM + attach ISO)  
👉 parfait pour INF109x (1 commande → environnement clean)
