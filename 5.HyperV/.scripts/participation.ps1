#!/usr/bin/env pwsh
# --------------------------------------
# Dynamic participation script
# --------------------------------------

param(
    [int]$Group = 1,
    [int]$GroupSize = 4
)


# Pass parameter to students.ps1
. ../.scripts/students.ps1 -GroupSize $GroupSize

# --------------------------------------
# VALIDATION
# --------------------------------------

if ($Group -lt 1 -or $Group -gt $LAB_GROUPS.Count) {
    throw "Groupe invalide (1-$($LAB_GROUPS.Count))"
}

# --------------------------------------
# LOAD CURRENT GROUP
# --------------------------------------

$GROUP_DATA = $LAB_GROUPS[$Group - 1]

$ACTIVE_GROUP   = $GROUP_DATA.Students

# Importer les fonctions
. ../.scripts/functions.ps1
. ../.scripts/commons.ps1

Write-ParticipationHeader
Write-PresenceHeader

$s = 0

for ($i = 0; $i -lt $ACTIVE_GROUP.Count; $i++) {

    $parts = $ACTIVE_GROUP[$i] -split '\|'
    
    $StudentID = $parts[0]
    $GitHubID  = $parts[1]
    $AvatarID  = $parts[2]

    $paths  = Get-StudentPaths -StudentID $StudentID
    $checks = Get-StudentChecks -Paths $paths
    $url    = Get-GitHubAvatarLink -GitHubID $GitHubID -AvatarID $AvatarID

    Write-StudentRow `
        -Index ($i + 1) `
        -StudentID $StudentID `
        -GitHubLink $url `
        -ReadmePath $paths.README `
        -Checks $checks

    if (Test-AllRequiredFilesPresent -Checks $checks) {
        $s++
    }

}

Write-Summary -SuccessCount $s -TotalCount $i
