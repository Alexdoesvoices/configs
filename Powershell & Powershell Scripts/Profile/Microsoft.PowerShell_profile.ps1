# Start starship dock:
Invoke-Expression (&starship init powershell)

# PSHELP COMMAND
function Pshelp-Container {
@"
clls - Clear the screen and list the contents of the directory at the same time.
touch - Creates a file in the current directory.
"@
}
Set-Alias pshelp Pshelp-Container
# End.

#! Alias for Clearing and Ls:
function clear-ls {
    Clear-Host
    Get-ChildItem
}
Set-Alias clls clear-ls
# END

#! Creates a file in the current directory:
function touch($file) {
        "" | Out-File $file -Encoding ASCII
}

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Clear-Host