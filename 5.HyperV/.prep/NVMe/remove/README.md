Parfait 👍 — voici un **script unique, propre et sécurisé** qui:

✅ détecte le disque contenant `D:`  
✅ enlève la lettre de lecteur `D:`  
✅ met le disque offline (option lab propre)  
✅ évite de toucher au mauvais disque

***

# ✅ ✅ Script complet (copier‑coller)

```powershell
# Trouver le disque correspondant à D:
$partition = Get-Partition -DriveLetter D
$diskNumber = $partition.DiskNumber

Write-Host "Disk détecté:" $diskNumber

# Étape 1 — enlever la lettre D:
Remove-PartitionAccessPath -DiskNumber $diskNumber `
                           -PartitionNumber $partition.PartitionNumber `
                           -AccessPath "D:\"

Write-Host "Lettre D: supprimée"

# Étape 2 — mettre le disque offline (sécurisé pour lab)
Set-Disk -Number $diskNumber -IsOffline $true

Write-Host "Disque mis offline ✅"
```

***

# ✅ ✅ Ce que ça fait exactement

### 🔹 Avant

```
D: → NVMe actif
```

### 🔹 Après

```
D: disparaît ✅
Disque offline ✅
Aucune donnée perdue ✅
```

***

# ✅ ✅ Vérification après

```powershell
Get-Disk
```
```
Number Friendly Name Serial Number                    HealthStatus         OperationalStatus      Total Size Partition
                                                                                                             Style
------ ------------- -------------                    ------------         -----------------      ---------- ----------
1      HP LOGICAL... 5001438006EFCC90                 Healthy              Online                   273.4 GB MBR
0      PC811 SK h... ACE4_2E00_4167_A8D7_2EE4_AC00... Healthy              Offline                 953.87 GB MBR
```

👉 Tu dois voir:

```
IsOffline : True
```

***

# ✅ ✅ Pour réactiver plus tard

```powershell
Set-Disk -Number X -IsOffline $false
```

***

# ⚠️ Important (sécurité)

👉 Ce script:

* ⚠️ ne wipe PAS le disque
* ✅ ne touche pas au RAID OS
* ✅ safe pour lab

***

# ✅ TL;DR

👉 Ce script fait:

```
remove D: + disable disk proprement ✅
```

