# This file makes a copy and writes the hash of the file to a text file

# Hit the up arrow to rerun the last command
# Hit the tab key to autocomplete


# Create a folder for our results 
New-Item -ItemType Directory -Force -Path ./001-RESULTS

# Create a folder for our forensic copy
New-Item -ItemType Directory -Force -Path ./001-evidence-COPY

# Copy the evidence files to a new folder
Copy-Item ./001-evidence/doc1.txt ./001-evidence-COPY/doc1.txt
Copy-Item ./001-evidence/doc2.txt ./001-evidence-COPY/doc2.txt

# Calcuate the hash of each evidence file and write it to a text file
Get-FileHash ./001-evidence/doc1.txt -Algorithm SHA256 | Out-File ./001-RESULTS/hash1.txt
Get-FileHash ./001-evidence/doc2.txt -Algorithm SHA256 | Out-File ./001-RESULTS/hash2.txt

# Calculate the hash of each copied file and write it to a text file
Get-FileHash ./001-evidence-COPY/doc1.txt -Algorithm SHA256 | Out-File ./001-RESULTS/hash1-copy.txt
Get-FileHash ./001-evidence-COPY/doc1.txt -Algorithm SHA256 | Out-File ./001-RESULTS/hash1-copy.txt
