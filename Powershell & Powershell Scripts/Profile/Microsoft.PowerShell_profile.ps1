# PSHELP COMMAND
function Ps-Help-Container {
@"
clls - Clear the screen and list the contents of the directory at the same time.
"@
}
Set-Alias pshelp Ps-Help-Container
# End.


# Start starship dock:
Invoke-Expression (&starship init powershell)


# Alias for Clearing and Ls:
function clear-ls {
    Clear-Host
    Get-ChildItem
}
Set-Alias clls clear-ls
# END


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
