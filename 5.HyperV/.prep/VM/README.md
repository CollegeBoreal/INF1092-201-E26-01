
### 1. Création de la VM

```powershell
New-VM -Name "VM300098957" `
  -MemoryStartupBytes 4GB `
  -NewVHDPath "D:\VMs\VM300098957.vhdx" `
  -NewVHDSizeBytes 100GB `
  -SwitchName "External"

```
```lua
Name        State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----        ----- ----------- ----------------- ------   ------             -------
VM300098957 Off   0           0                 00:00:00 Operating normally 10.0
```

### 2. Activation nested virtualization

```powershell
Set-VMProcessor -VMName "VM300098957" -Count 2 -ExposeVirtualizationExtensions $true
```

### 🔸 2. Dynamic Memory (optionnel mais utile en lab)

```powershell

Set-VMMemory -VMName "VM300098957" `
  -DynamicMemoryEnabled $true `
  -MinimumBytes 2GB `
  -MaximumBytes 6GB
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
$iso="D:\ISO\WindowsServer2022.iso"

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
