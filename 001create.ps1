<#
    PowerShell for Digital Forensics

    Case 001: Forensic Copy
    Create example evidence files

    Author:  Denise Case
    Date:    2023-03-09

#>

# Clear the terminal window
Clear-Host

# Write header to the console
Write-Output ""
Write-Output "------------------------------------------------------"
Write-Output "Starting CASE 001 CREATE EVIDENCE script"
Write-Output "------------------------------------------------------"
Write-Output "In a PowerShell terminal, run:"
Write-Output ".\001create.ps1"
Write-Output ""
Write-Output "------------------------------------------------------"

# Set the path to the evidence folder
$evidencePath = ".\001_Evidence"

# Call the undo script to start fresh
.\001undo.ps1

# Test-Path
# is a PowerShell cmdlet that tests whether a path exists.
# -PathType parameter specifies the type of path to test.
# In this case, it should be a Container (folder).

New-Item -ItemType Directory -Path $evidencePath | Out-Null
# New-Item
# is a PowerShell cmdlet that creates a new item (file or folder).
# -ItemType parameter specifies the type of item to create. 
# In this case, it's a Directory.
# -Path parameter specifies the path where the item should be created.
# The | Out-Null at the end of the command 
# is used to suppress the output from the command,
# so that it doesn't clutter the console or pipeline output.

# Create some sample files in the evidence folder
# for i = 1 to less than or equal to 5, increasing by 1 each time
for ($i = 1; $i -le 5; $i++) {

    # Create a file with the name "file_i.txt"
    $fileName = "file_$i.txt"

    # Use Join-Path to concatenate folder and file name.
    # Before this, we had to watch out for
    # things like ending slashes in the folder path
    # and if they're forward slashs or backslashes 
    # (Windows is backwards - Linus uses forward slashes)
    # Also, slashes are used as escape characters in PowerShell.
    # In short, it's a pain to deal with path slashes.
    # Use Join-Path and prosper.
    $filePath = Join-Path $evidencePath $fileName

    # Add some content to the file amd write it to disk.
    Set-Content -Path $filePath -Value "This is a sample file number $i"
    # Set-Content is a PowerShell cmdlet that creates a file
    # and writes the specified content to it.
    # The -Path parameter specifies the path to the file to create.
    # The -Value parameter specifies the content to write to the file.
}

Write-Output "Done creating evidence. See new $evidencePath subfolder."
Write-Output "------------------------------------------------------"