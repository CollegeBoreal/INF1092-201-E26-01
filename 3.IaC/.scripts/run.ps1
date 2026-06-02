#!/usr/bin/env pwsh
# --------------------------------------
# PowerShell equivalent of:
# bash .scripts/participation.sh > .scripts/Participation.md 2>/dev/null
# --------------------------------------

# Run the participation script and redirect its output
# Standard output -> .scripts/Participation.md
# Errors -> $null (discarded)

pwsh .scripts/participation.ps1 -Group 1 > .scripts/Participation-group1.md 2>$null
pwsh .scripts/participation.ps1 -Group 2 > .scripts/Participation-group2.md 2>$null
pwsh .scripts/participation.ps1 -Group 3 > .scripts/Participation-group3.md 2>$null
pwsh .scripts/participation.ps1 -Group 4 > .scripts/Participation-group4.md 2>$null
pwsh .scripts/participation.ps1 -Group 5 > .scripts/Participation-group5.md 2>$null
pwsh .scripts/participation.ps1 -Group 6 > .scripts/Participation-group6.md 2>$null
pwsh .scripts/participation.ps1 -Group 7 > .scripts/Participation-group7.md 2>$null
pwsh .scripts/participation.ps1 -Group 8 > .scripts/Participation-group8.md 2>$null


