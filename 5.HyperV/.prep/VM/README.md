
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
