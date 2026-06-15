#!/usr/bin/env pwsh
# --------------------------------------
# Dynamic Participation Generator
# --------------------------------------

$GROUP_SIZE = 4   # 👈 change here

# Load students + compute groups
. ../.scripts/students.ps1 -GroupSize $GROUP_SIZE

# Nombre de groupes dynamiques
$GROUP_COUNT = $LAB_GROUPS.Count

for ($g = 1; $g -le $GROUP_COUNT; $g++) {
    
    $outfile = ".scripts/Participation-group$g.md"
    
    pwsh .scripts/participation.ps1 -Group $g > $outfile 2>$null

    Write-Host "Generated: $outfile"
}