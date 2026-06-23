$vm="VMXXXXXXX"
$iso="D:\ISO\XXXXXXX\win2022.iso"

New-VM -Name $vm -Generation 1 -MemoryStartupBytes 4GB `
  -NewVHDPath "D:\VMs\$vm\$vm.vhdx" -NewVHDSizeBytes 60GB `
  -SwitchName "External"

Set-VMProcessor -VMName $vm -Count 2
Set-VMMemory -VMName $vm -DynamicMemoryEnabled $false

Set-VMDvdDrive -VMName $vm -ControllerNumber 1 -ControllerLocation 0 -Path $iso

Start-VM -Name $vm
