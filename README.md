# dfir-pwsh-forensic-copy

> Digital Forensics - PowerShell Skills

Welcome - this repository is designed to help users develop 
PowerShell skills for digital forensics purposes. 
The primary focus is on copying forensic evidence and 
verifying the copied data with hash values to ensure the 
integrity of the evidence. 

The repository provides a collection of PowerShell scripts and resources 
to facilitate building practical skills in digital forensics.

## Recommended Tools

- Git
- PowerShell
- VS Code
- VS Code Extension: Remote Repositories (by Microsoft)
- VS Code Extension: PowerShell (by Microsoft)

## Technical Notes

Use the VS Code menu to open a new terminal (Terminal \ New Terminal or any other method you like).

In PowerShell commands, the .\ notation specifies the current working directory, allowing commands to reference files and folders located in the current working directory without needing to specify the full path.

The .\ ensures the file is executed as a script rather than a system command or alias, and it helps prevent users from accidentally running a system command or alias with the same name as their script.

SLASH DIRECTION. The slash notation for running scripts in PowerShell uses a backslash (\), not a forward slash (/).
In both Windows and Mac/Linux environments, the correct notation is .\\script.ps1 when referencing the current directory.
However, on Mac/Linux, PowerShell is often run with a forward slash (/) in general, but Windows always uses the backslash for file paths.

## PowerShell Commands

`New-Item -ItemType Directory -Force -Path`

This command creates a new directory with the specified name and path. 
The -ItemType parameter specifies the type of item to create 
(in this case, a directory), the -Force parameter allows the 
command to overwrite existing directories with the same name, 
and the -Path parameter specifies the location of the new directory.

`Copy-Item`

This command is used to copy files and folders from one location to another. 
It takes two arguments: the source path of the file/folder to be copied, 
and the destination path of the copied file/folder.

`Get-FileHash`

This command computes the hash value of a specified file using a chosen 
hashing algorithm. The -Algorithm parameter specifies the hashing 
algorithm to use, and the output can be saved to a file using the 
Out-File command.

`Out-File`

This command is used to save the output of a command to a text file. 
The output can be piped to Out-File, which takes the file path as an argument.


## Case 001 

For Case 001, 

1. Create your own evidence files in a subfolder (e.g., 001-evidence).
2. Modify the 001-fc-script.ps1 to create your own copy and hash resuts.

## Run Script

In VS Code, 

 - use Terminal / New Terminal to open a terminal window. 
 - If the default terminal is cmd, use the drop-down to change to PowerShell. 

Type:

```
.\001-fc-script.ps1
```

Hit ENTER to run the script, make a copy of the evidence, 
and calculate the hashes.

-----

## Case 555 - Generate / Verify / Undo

The Case 555 advanced example includes PowerShell scripts to:

1. Create an example evidence folder with files
2. Create a forensic copy of the evidence for analysis
3. Recheck hashes to ensure no changes have been introduced to the copy.
4. Undo all the files and clean things up. 

The commands to run these scripts follow.

```
.\555create.ps1
.\555fc.ps1
.\555recheck.ps1
.\555undo.ps1
```


