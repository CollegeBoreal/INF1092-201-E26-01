

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
