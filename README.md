# dfir-pwsh-forensic-copy
Digital Forensics - PowerShell - Forensic Copy Example

This repo includes PowerShell scripts to:

1. Create an example evidence folder with files
2. Create a forensic copy of the evidence for analysis
3. Recheck hashes to ensure no changes have been introduced to the copy.
4. Undo all the files and clean things up. 

The commands to run them are below. 

```
.\001create.ps1
.\001fc.ps1
.\001recheck.ps1
.\001undo.ps1
```

## Tools

- Git
- PowerShell
- VS Code
- VS Code Extension: Remote Repositories (by Microsoft)
- VS Code Extension: PowerShell (by Microsoft)

Open PowerShell, type a command and hit ENTER to run a script.  

Notice which files and folders are created (or deleted).

