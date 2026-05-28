#!/usr/bin/env pwsh

# ---------- Fonctions ----------

function Get-StudentPaths {
    param(
        [string]$StudentID
    )

    return @{
        README   = "$StudentID/README.md"
        Images   = "$StudentID/images"
    }
}

function Get-StudentChecks {
    param(
        [hashtable]$Paths
    )

    return @{
        README    = Test-CommonItemExists -Path $Paths.README -IsReadme
        Images    = Test-CommonItemExists -Path $Paths.Images
    }
}

function Test-AllRequiredFilesPresent {
    param(
        [hashtable]$Checks
    )

    $validReadmeValues = @(
        ":1st_place_medal:",
        ":2nd_place_medal:"
    )

    return (
        $Checks.README -in $validReadmeValues -and
        $Checks.Images -eq ":heavy_check_mark:"
    )
}

function Write-PresenceHeader {
    Write-Output ""
    Write-Output "## :a: Présence"
    Write-Output ""

    Write-Output "|:hash:| Boréal :id: | README.md | images |"
    Write-Output "|------|-------------|-----------|--------|"
}


function Write-StudentRow {
    param(
        [int]$Index,
        [string]$StudentID,
        [string]$GitHubLink,
        [string]$ReadmePath,
        [hashtable]$Checks
    )

    Write-Output "| $Index | [$StudentID](../$ReadmePath) :point_right: $GitHubLink | $($Checks.README) | $($Checks.Images) |"
}