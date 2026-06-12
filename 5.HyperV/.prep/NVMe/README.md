
:x: RAID5 NAS Installed

```powershell
 Get-Disk
```
```
Number Friendly Name Serial Number                    HealthStatus         OperationalStatus      Total Size Partition
                                                                                                             Style
------ ------------- -------------                    ------------         -----------------      ---------- ----------
0      HP LOGICAL... 5001438006EFCC90                 Healthy              Online                   273.4 GB MBR
```

⚠️ 1TB Installed - offline

```powershell
get-disk
```
```
Number Friendly Name Serial Number                    HealthStatus         OperationalStatus      Total Size Partition
                                                                                                             Style
------ ------------- -------------                    ------------         -----------------      ---------- ----------
0      HP LOGICAL... 5001438006EFCC90                 Healthy              Online                   273.4 GB MBR
1      PC811 SK h... ACE4_2E00_4167_A8D7_2EE4_AC00... Healthy              Offline                 953.87 GB MBR
```

🚨 Formatter le disque

```powershell
# 1. Online
Set-Disk -Number 1 -IsOffline $false

# 2. Nettoyer (EFFACE TOUT)
Clear-Disk -Number 1 -RemoveData -Confirm:$false

# 3. Initialiser (GPT recommandé)
Initialize-Disk -Number 1 -PartitionStyle GPT

# 4. Créer partition + lettre + format
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter D | 
Format-Volume -FileSystem NTFS -NewFileSystemLabel "DATA" -Confirm:$false
```


✅ 1TB Installed

```powershell
Get-Volume
```
```
DriveLetter FriendlyName    FileSystemType DriveType HealthStatus OperationalStatus SizeRemaining      Size
----------- ------------    -------------- --------- ------------ ----------------- -------------      ----
F                           Unknown        CD-ROM    Healthy      Unknown                     0 B       0 B
D           DATA            NTFS           Fixed     Healthy      OK                    953.72 GB 953.85 GB
            System Reserved NTFS           Fixed     Healthy      OK                     67.14 MB    100 MB
C                           NTFS           Fixed     Healthy      OK                    193.62 GB 272.79 GB
                            NTFS           Fixed     Healthy      OK                     83.39 MB    523 MB
```
