

```powershell
$vm="VM300098957"
$iso="D:\ISO\en-us_windows_server_2022_updated_july_2023_x64_dvd_541692c3.iso"

# 1. Create VM GEN1 (stable G6)
New-VM -Name $vm `
  -Generation 1 `
  -MemoryStartupBytes 4GB `
  -NewVHDPath "D:\VMs\$vm\$vm.vhdx" `
  -NewVHDSizeBytes 60GB `
  -SwitchName "External"

# 2. CPU
Set-VMProcessor -VMName $vm -Count 2

# 3. RAM
Set-VMMemory -VMName $vm `
  -DynamicMemoryEnabled $false

# 4. Ajouter ISO (IDE obligatoire en Gen1)
Set-VMDvdDrive -VMName $vm `
  -ControllerNumber 1 `
  -ControllerLocation 0 `
  -Path $iso

# 5. IMPORTANT : Boot CD first (sans toucher BIOS)
# (Hyper-V fait déjà CD en premier automatiquement en Gen1)

# 6. Start
Start-VM -Name $vm

```

```powershell
$vm="VM300098957"
$iso="D:\ISO\en-us_windows_server_2022_updated_july_2023_x64_dvd_541692c3.iso"

# 0. Clean TOTAL
Stop-VM -Name $vm -Force -ErrorAction SilentlyContinue
Remove-VM -Name $vm -Force -ErrorAction SilentlyContinue
Remove-Item "D:\VMs\$vm" -Recurse -Force -ErrorAction SilentlyContinue
```


### 🟢 3. Vérification

```powershell
$vm="VM300098957"

Get-VM -Name $vm
Get-VMMemory -VMName $vm
Get-VMProcessor -VMName $vm
Get-VMHardDiskDrive -VMName $vm
Get-VMNetworkAdapter -VMName $vm | Select VMName,SwitchName
```

```powershell
PS C:\Users\Administrator> Get-VM -Name $vm

Name        State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----        ----- ----------- ----------------- ------   ------             -------
VM300098957 Off   0           0                 00:00:00 Operating normally 10.0


PS C:\Users\Administrator> Get-VMMemory -VMName $vm

VMName      DynamicMemoryEnabled Minimum(M) Startup(M) Maximum(M)
------      -------------------- ---------- ---------- ----------
VM300098957 True                 2048       4096       6144


PS C:\Users\Administrator> Get-VMProcessor -VMName $vm

VMName      Count CompatibilityForMigrationEnabled CompatibilityForOlderOperatingSystemsEnabled
------      ----- -------------------------------- --------------------------------------------
VM300098957 2     False                            False


PS C:\Users\Administrator> Get-VMHardDiskDrive -VMName $vm

VMName      ControllerType ControllerNumber ControllerLocation DiskNumber Path
------      -------------- ---------------- ------------------ ---------- ----
VM300098957 IDE            0                0                             D:\VMs\VM300098957.vhdx


PS C:\Users\Administrator> Get-VMNetworkAdapter -VMName $vm | Select VMName,SwitchName

VMName      SwitchName
------      ----------
VM300098957 External
```

```powershell
$vm="VM300098957"
$iso="D:\ISO\en-us_windows_server_2022_updated_july_2023_x64_dvd_541692c3.iso"

# 1. Créer la VM
New-VM -Name $vm `
  -MemoryStartupBytes 4GB `
  -NewVHDPath "D:\VMs\$vm\$vm.vhdx" `
  -NewVHDSizeBytes 100GB `
  -SwitchName "External"

# 2. CPU + virtualisation imbriquée
Set-VMProcessor -VMName $vm -Count 2 -ExposeVirtualizationExtensions $true

# 3. RAM dynamique (optionnel mais recommandé en lab)
Set-VMMemory -VMName $vm `
  -DynamicMemoryEnabled $true `
  -MinimumBytes 2GB `
  -MaximumBytes 6GB

# 4. Ajouter lecteur DVD + ISO
Add-VMDvdDrive -VMName $vm -Path $iso

# 5. Mettre boot sur ISO
Set-VMFirmware -VMName $vm `
  -FirstBootDevice (Get-VMDvdDrive -VMName $vm)

# (Option Linux)
# Set-VMFirmware -VMName $vm -EnableSecureBoot Off

# 6. Démarrer la VM
Start-VM -Name $vm

# 7. Vérifier
Get-VM -Name $vm
```
