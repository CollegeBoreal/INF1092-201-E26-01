#!/usr/bin/env pwsh
param(
    [switch]$Quiet
)

$dirs = @(
)

foreach ($dir in $dirs) {
    Write-Output "=> $dir"

    Push-Location $dir
    try {
        if ($Quiet) {
            ./.scripts/grading/push_grades.ps1 *> $null
        }
        else {
            ./.scripts/grading/push_grades.ps1
        }
    }
    finally {
        Pop-Location
    }
}