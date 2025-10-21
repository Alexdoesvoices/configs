# TODO: Uncomment the following line once starship is installed:
# Invoke-Expression (&starship init powershell)

function pshelp {   #? This is my 'help' command.
@"
cc - Clear the screen and Cat a file.
coc - Added Compare Cat.
clls - Clear the screen and list the contents of the directory at the same time.
touch - Creates a file in the current directory.
"@
}

function clear-cat {   #? This function clears the screen and cats a file at the same time.
  Clear-Host
  Get-Content @args
}
Set-Alias cc clear-cat

function Compare-Cat {
    param(
        # The file paths parameter now accepts an array of strings (string[])
        [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
        [string[]]$Paths 
    )
    
    $SeparatorLine = "-----------------------------------"
    Clear-Host 
    
    foreach ($Path in $Paths) {
        try {
            $FileInfo = Get-Item -Path $Path -ErrorAction Stop
            Write-Host ""
            Write-Host "File: $($FileInfo.Name)" -ForegroundColor Green
            Write-Host $SeparatorLine -ForegroundColor DarkGray
            Get-Content -Path $FileInfo.FullName
            Write-Host $SeparatorLine -ForegroundColor DarkGray
            
        } catch {
            Write-Error "Failed to process file '$Path'. Detail: $($_.Exception.Message)"
            continue 
        }
    }
}
set-alias coc Compare-Cat;

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
