ID: 300124366
Atelier: Creation de MV avec Hyper-V

```powershell
$vm="VM300124366"
$iso="E:\ISO\300124366\en-us_windows_server_2022_updated_july_2023_x64_dvd_541692c3 (1).iso"

New-VM -Name $vm -Generation 1 -MemoryStartupBytes 4GB `
  -NewVHDPath "D:\VMs\$vm\$vm.vhdx" -NewVHDSizeBytes 60GB `
  -SwitchName "External"

Set-VMProcessor -VMName $vm -Count 2
Set-VMMemory -VMName $vm -DynamicMemoryEnabled $false

Set-VMDvdDrive -VMName $vm -ControllerNumber 1 -ControllerLocation 0 -Path $iso

Start-VM -Name $vm
```
