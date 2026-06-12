$templateVHD = "D:\VMs\VM300098957\VM300098957.vhdx"
$vmRoot = "D:\VMs"
$switch = "External"

$start = 1
$count = 10

for ($i = $start; $i -le $count; $i++) {

    $vmName = "TEST{0:D2}" -f $i
    $vmPath = "$vmRoot\$vmName"
    $vhdPath = "$vmPath\$vmName.vhdx"

    # Créer dossier
    New-Item -ItemType Directory -Path $vmPath -Force | Out-Null

    # Copier disque (FULL COPY ✅)
    Copy-Item -Path $templateVHD -Destination $vhdPath

    # Créer VM
    New-VM -Name $vmName `
        -MemoryStartupBytes 4GB `
        -Generation 1 `
        -VHDPath $vhdPath `
        -Path $vmPath `
        -SwitchName $switch | Out-Null

    # CPU limit (important sur G6)
    Set-VMProcessor -VMName $vmName -Maximum 75

    # Dynamic memory (FIXED ✅)
    Set-VMMemory -VMName $vmName `
        -DynamicMemoryEnabled $true `
        -MinimumBytes 2GB `
        -MaximumBytes 4GB
}
