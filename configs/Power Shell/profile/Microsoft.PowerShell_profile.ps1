# PSHELP COMMAND
function pshelp {
# clear
@"
.. - Move up one in the File System.
... - Move uo two in the File System.
apdata - Enters the Apdata: ps drive.
clls - Clear the screen and list the contents of the directory at the same time.
cc - Clear the screen and get content.
dev - Enter the dev: ps drive.
fpwd - Prints out the full path to your current directory.
gitc - Enters the GITCLONES: ps drive.
home - Return to root.
me - Micro Editor.
newproject - Run the Project Distro Maker script.
sph - Split Terminal Horizontal, maintain drive locations.
spv - Split Terminal Verticle, maintain drive locations.
touch - Create a file in the current directory.
"@
}

#! Scripts Path Variable:  
$pscripts = "C:\Users\alexr\scripts\ps"

#! PsDrives and Nav shortcuts:
. "$pscripts\drivesandnav.ps1"

#! Utility Commands:
. "$pscripts\aliaslist.ps1"
. "$pscripts\ProjectMaker-V3.ps1"
# . "$pscripts\projectcreator-v4.ps1"
. "$pscripts\clearcat.ps1"
. "$pscripts\clls.ps1"
. "$pscripts\generalalias.ps1"
. "$pscripts\googlesearch.ps1"
. "$pscripts\terminalsplits.ps1"
. "$pscripts\touch.ps1"

Invoke-Expression (&starship init powershell)
Clear-Host

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
