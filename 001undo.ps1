<#
    PowerShell for Digital Forensics

    Case 001: Forensic Copy
    Remove example files

    Author:  Denise Case
    Date:    2023-03-09

#>

function DeleteEvidenceFolder($evPath) {
    if (Test-Path $evPath -PathType Container) {
        Get-ChildItem -Path $evPath | Where-Object { $_.PSIsContainer -eq $false } | Remove-Item -Force
        Remove-Item $evPath -Force -Recurse
        Write-Output "     Deleted directory '$evPath' and any child files."
    }
}

Write-Output ""
Write-Output "------------------------------------------------------"
Write-Output "     Starting CASE 001 UNDO script"
Write-Output "------------------------------------------------------"

$evidencePath = ".\001_Evidence"
$evidenceCopyPath = ".\001_Evidence_Copy_$(Get-Date -Format yyyy-MM-dd)"
$evidenceOutPath = ".\001_Evidence_Out_$(Get-Date -Format yyyy-MM-dd)"
DeleteEvidenceFolder $evidencePath
DeleteEvidenceFolder $evidenceCopyPath
DeleteEvidenceFolder $evidenceOutPath

Write-Output "     Done cleaning up any old evidence."
Write-Output "------------------------------------------------------"