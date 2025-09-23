# TODO: Uncomment the following line once starship is installed:
# Invoke-Expression (&starship init powershell)

function pshelp {   #? This is my 'help' command.
@"
cc - Clear the screen and Cat a file.
clls - Clear the screen and list the contents of the directory at the same time.
touch - Creates a file in the current directory.
"@
}

function clear-cat {   #? This function clears the screen and cats a file at the same time.
  Clear-Host
  Get-Content @args
}
Set-Alias cc clear-cat

function clear-ls {   #? This function clears the screen and list out current directories content.
    Clear-Host
    Get-ChildItem
}
Set-Alias clls clear-ls

function touch($file) {   #? This function creates a file in the current directory with the provided name.
        "" | Out-File $file -Encoding ASCII
}

# TODO: Uncomment the following 4 lines once Chocolaty is installed:
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }

Clear-Host