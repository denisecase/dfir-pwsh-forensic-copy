<#
    PowerShell for Digital Forensics

    Case 001: Forensic Copy
    Recheck / reverify a forensic copy of the evidence 
    (Introduce a change to the forensic copy and verify it gets detected)

    Author:  Denise Case
    Date:    2023-03-09

#>

function DeleteEvidenceFolder($evPath) {
  if (Test-Path $evPath -PathType Container) {
    Get-ChildItem -Path $evPath | Where-Object { $_.PSIsContainer -eq $false } | Remove-Item -Force
    Remove-Item $evPath -Force -Recurse
    Write-Output "Deleted directory '$evPath' and its immediate child files."
  }
}

Clear-Host

write-output ""
Write-Output "------------------------------------------------------"
Write-Output "Starting CASE 001 FORENSIC COPY RECHECK script"
Write-Output "------------------------------------------------------"
write-output "In a PowerShell terminal, run:"
Write-Output ".\001recheck.ps1"
write-output ""
Write-Output "------------------------------------------------------"

$evidencePath = ".\001_Evidence"
$evidenceCopyPath = ".\001_Evidence_Copy_$(Get-Date -Format yyyy-MM-dd)"
$evidenceOutPath = ".\001_Evidence_Out_$(Get-Date -Format yyyy-MM-dd)"

# Delete and recreate the output folder
DeleteEvidenceFolder $evidenceOutPath
New-Item -ItemType Directory -Path $evidenceOutPath | Out-Null

# If the evidence folder doesn't exist, create it
if (-not (Test-Path $evidencePath -PathType Container)) {
  # Execute 001create.ps1 script
  .\001create.ps1
}

# If the forensic copy folder doesn't exist, create it
# You'll want to make a change to the forensic copy to see it get detected
if (-not (Test-Path $evidenceCopyPath -PathType Container)) {
  .\001fc.ps1
}

# Verify the integrity of the forensic copy
Write-Host "Verifying integrity of the forensic copy..."

# Calculate the hashes of the evidence along with the short file name
$fileHash = @{Name='Hash';Expression={(Get-FileHash $_.FullName).Hash}} 
$baseName = @{Name='BaseName';Expression={$_.BaseName}}
$evidenceItems = Get-ChildItem -Path $evidencePath -Recurse
$hashes = $evidenceItems | Select-Object $baseName, $fileHash

# Calculate the hashes of the forensic copy along with the short file name
$copyHashes = Get-ChildItem -Path $evidenceCopyPath -Recurse | Where-Object { -not $_.PSIsContainer } | Select-Object $baseName, $fileHash

# Write the hashes to csv files
$hashes | Export-Csv -Path "$evidenceOutPath\recheck-basis.csv" -NoTypeInformation
$copyHashes | Export-Csv -Path "$evidenceOutPath\recheck-copy.csv" -NoTypeInformation

# Compare the hashes between the evidence and forensic copy
$hashComparison = Compare-Object -ReferenceObject $hashes -DifferenceObject $copyHashes -Property Hash, BaseName

# Write the differences to a csv file
$hashComparison | Export-Csv -Path "$evidenceOutPath\recheck-diff.csv" -NoTypeInformation

# Count the number of differences (one line for each hash or each side of the comparison)
$diffCount = $hashComparison.Count /2 
Write-Output "Differences found: $diffCount"

if ($diffCount -eq 0) {
  Write-Host "Evidence copy verified successfully!"
  Write-Output "See new evidence summary at $evidenceOutPath."
  Write-Output "Done."
} else {
  Write-Host "Evidence copy verification failed: $diffCount differences found."
  $diffOutput = @()
  foreach ($diff in $hashComparison) {
     $diffOutput += $diff
  }
  Write-Output "The following differences were found:"
  Write-Output $diffOutput
}
Write-Output "------------------------------------------------------"