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
$ACTIVE_SERVERS = $GROUP_DATA.Servers
$PROXMOX_SERVER = $GROUP_DATA.Proxmox
$TOFU_SECRET    = $GROUP_DATA.Token

# --------------------------------------
# HEADER
# --------------------------------------

Write-Output "# Participation – Groupe $Group"
Write-Output ""

Write-Output "| Table des matières            | Description                                             |"
Write-Output "|-------------------------------|---------------------------------------------------------|"
Write-Output "| :a: [Présence](#a-présence)   | L'étudiant.e a fait son travail    :heavy_check_mark:   |"
Write-Output "| :b: [Précision](#b-précision) | L'étudiant.e a réussi son travail  :tada:               |"

Write-Output ""
Write-Output "## Légende"
Write-Output ""
Write-Output "| Signe              | Signification                 |"
Write-Output "|--------------------|-------------------------------|"
Write-Output "| :heavy_check_mark: | Prêt à être corrigé           |"
Write-Output "| :x:                | Projet inexistant             |"
Write-Output "| :1st_place_medal:  | Excellent                     |"
Write-Output "| :2nd_place_medal:  | Merci d'avoir participé       |"

Write-Output ""
Write-Output "## :gear: Configuration"
Write-Output ""
Write-Output "| Proxmox Serveur                                     | User/Pwd         |"
Write-Output "|-----------------------------------------------------|------------------|"
Write-Output "| [${PROXMOX_SERVER}](https://${PROXMOX_SERVER}:8006) | root/Boreal@2026 |"

Write-Output ""
Write-Output "| TOFU Credentials                                    | :closed_lock_with_key: Secret |"
Write-Output "|-----------------------------------------------------|------------------------------|"
Write-Output "| tofu@pve!opentofu                                   | ${TOFU_SECRET}               |"

# --------------------------------------
# TABLE HEADER
# --------------------------------------

Write-Output ""
Write-Output "## :a: Présence"
Write-Output ""
Write-Output "|:hash:| Boréal :id: | README.md | images | main.tf | :link: IP |"
Write-Output "|------|-------------|-----------|--------|---------|------------|"

# --------------------------------------
# LOOP
# --------------------------------------

$i = 0
$s = 0

for ($g = 0; $g -lt $ACTIVE_GROUP.Count; $g++) {

    $parts = $ACTIVE_GROUP[$g] -split '\|'

    $StudentID = $parts[0]
    $GitHubID  = $parts[1]
    $AvatarID  = $parts[2]

    $ServerID = if ($g -lt $ACTIVE_SERVERS.Count) {
        $ACTIVE_SERVERS[$g]
    } else {
        "N/A"
    }

    $AvatarLink = "[<img src='https://avatars.githubusercontent.com/u/$AvatarID?s=40' width=20 height=20>](https://github.com/$GitHubID)"

    $FILE    = "$StudentID/README.md"
    $FOLDER  = "$StudentID/images"
    $TF_FILE = "$StudentID/main.tf"

    # --- README ---
    if (-not (Test-Path $FILE)) {
        $README_STATUS = ":x:"
    }
    else {
        $Content = Get-Content $FILE -Raw
        $HasText = ($Content -match '\S')
        $HasImg  = ($Content -match '!\[') -or ($Content -match '<img') -or ($Content -match '<image')

        if ($HasText -and $HasImg) {
            $README_STATUS = ":1st_place_medal:"
        } else {
            $README_STATUS = ":2nd_place_medal:"
        }
    }

    # --- Images ---
    $IMAGES_STATUS = if (Test-Path $FOLDER) { ":heavy_check_mark:" } else { ":x:" }

    # --- Terraform ---
    $TF_STATUS = if (Test-Path $TF_FILE) { ":heavy_check_mark:" } else { ":x:" }

    # --- OUTPUT LINE ---
    Write-Output "| $i | [$StudentID](../$FILE) $AvatarLink | $README_STATUS | $IMAGES_STATUS | $TF_STATUS | $ServerID |"

    if ($README_STATUS -ne ":x:") { $s++ }
    $i++
}

# --------------------------------------
# STATS
# --------------------------------------

$COUNT = "\$\\frac{$s}{$i}\$"
$PERCENT = if ($i -gt 0) { [math]::Round(($s * 100.0 / $i), 2) } else { 0 }
$SUM = "\$\displaystyle\sum_{i=1}^{$i} s_i\$"

Write-Output "| :abacus: | $COUNT = $PERCENT% | $SUM = $s |"
