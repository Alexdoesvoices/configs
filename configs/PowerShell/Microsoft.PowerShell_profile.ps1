

$psroot = "C:\Users\$Env:UserName\Documents\PowerShell\"
$psscripts = "C:\Users\$Env:UserName\Documents\PowerShell\scripts"


# ! Ps7 config
. "$psroot\ps7config.ps1"

# ! FZF config
. "$psroot\fzf.ps1"


#! Utility Commands:
. "$psscripts\aliaslist.ps1"
. "$psscripts\clearcat.ps1"
. "$psscripts\clls.ps1"
. "$psscripts\drivesandnav.ps1"
. "$psscripts\generalalias.ps1"
. "$psscripts\googlesearch.ps1"
. "$psscripts\projectmaker-V3.ps1"
. "$psscripts\terminalsplits.ps1"
. "$psscripts\touch.ps1"
. "$psscripts\yt-dlp.ps1"
. "$psscripts\mise.ps1"
. "$psscripts\goversion.ps1"
. "$psscripts\developer-shortcuts.ps1"





$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#* Fast Node Manager
# fnm env --use-on-cd --shell powershell --version-file-strategy=recursive | Out-String | Invoke-Expression

#* Mise
Invoke-Expression (mise activate pwsh | Out-String)


#* Starship
Invoke-Expression (&starship init powershell)
