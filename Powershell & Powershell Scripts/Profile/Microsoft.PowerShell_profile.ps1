
# PSHELP COMMAND
function Ps-Help-Container {
@"
newproject - Run the Project Distro Maker script.

twitchchatreader - Runs a script that reads twitch chat.

{dev,evsp} - Enter the VSP: ps drive.

epsc - Enter the PSC: ps drive.

egit - Enters the GITCLONES: ps drive.

apdata - Enters the Apdata: ps drive

clls - Clear the screen and list the contents of the directory at the same time.

tn - Changes the terminal tab name.

me - Micro Editor
"@
}
Set-Alias pshelp Ps-Help-Container
# End.


# Start starship dock:
Invoke-Expression (&starship init powershell)

# PSdrive's
New-PSDrive -Name "dev" -PSProvider "FileSystem" -Root "P:\3.Visual Studio\Projects"
New-PSDrive -Name "psc" -PSProvider "FileSystem" -Root "P:\3.Visual Studio\Powershell Scripts"
New-PSDrive -Name "gitclones" -PSProvider "FileSystem" -Root "P:\3.Visual Studio\Projects\gitclones"
New-PSDrive -Name "apdata" -PSProvider "FileSystem" -Root "C:\Users\alexr\AppData\Roaming"

# Declare Powershell Scripts Folder:
$ps_script_dir = "P:\3.Visual Studio\Powershell Scripts"

# Sets alias for the project-distro creation script:
New-Alias newproject $ps_script_dir\'ProjectMaker-V3.ps1'

# Chat Reader Alias
New-Alias twitchchatreader $ps_script_dir\'chatreader.ps1'

# Enter git clones:
function enter-gitc {
    Set-Location gitclones:/
    echo "Entering gitclones:"
}
Set-Alias egit enter-gitc
# End

# Enter DEV / VSP:
function enter-dev {
    Set-Location dev:/
    echo "Entering dev:"
}
Set-Alias dev enter-dev
Set-Alias evsp enter-dev

# End

# Enter PSC:
function enter-psc {
    Set-Location psc:/
    echo "Entering PSC:"

}
Set-Alias epsc enter-psc
# End

# Alias for Clearing and Ls:
function clear-ls {
    Clear-Host
    Get-ChildItem
}
Set-Alias clls clear-ls
# END

# Alias for entering apdata
function enter-apdata {
    Set-Location apdata:/
    echo "Entering apdata:"
}
Set-Alias apdata enter-apdata
# end

function Set-TerminalTabName {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    # Windows Terminal supports this ANSI escape sequence to rename the tab
    $esc = [char]27
    "$esc]0;$Name`a"
}
set-Alias tn Set-TerminalTabName


function Micro-Editor-Shortcut {
	micro @args
}
set-Alias me Micro-Editor-Shortcut

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Clear-Host
