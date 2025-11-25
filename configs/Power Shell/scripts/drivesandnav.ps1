New-PSDrive -Name "dev" -PSProvider "FileSystem" -Root "P:\3.Visual Studio\Projects"
New-PSDrive -Name "psc" -PSProvider "FileSystem" -Root "P:\3.Visual Studio\Powershell Scripts"
New-PSDrive -Name "gitclones" -PSProvider "FileSystem" -Root "P:\3.Visual Studio\Projects\gitclones"
New-PSDrive -Name "apdata" -PSProvider "FileSystem" -Root "C:\Users\alexr\AppData\Roaming"
New-PSDrive -Name "scripts" -PSProvider "FileSystem" -Root "C:\Users\alexr\scripts"
New-PSDrive -Name "psscripts" -PSProvider "FileSystem" -Root "C:\Users\alexr\scripts\ps"
New-PSDrive -Name "dotconfigs" -PSProvider "FileSystem" -Root "C:\Users\alexr\.config"

function enter-root {
	Set-Location ~
	Write-Host "Returning to Root: "
}
Set-Alias home enter-root

function enter-dev {
	Set-Location dev:/
	Write-Host "Entering Dev: "
}
Set-Alias dev enter-dev
Set-Alias dec enter-dev

function enter-gitclones {
	Set-Location gitclones:/
	Write-Host "Entering Git Clones: "
}
Set-Alias gitc enter-gitclones

function enter-psc {
	Set-Location psc:/
	Write-Host "Entering Psc: "
}
Set-Alias psc enter-psc

function enter-apdata {
	Set-Location apdata:/
	Write-host "Entering Apdata: "
}
Set-Alias apdata enter-apdata

function enter-scripts {
	Set-Location scripts:/
	Write-Host "Entering Scripts: "
}
Set-Alias scripts enter-scripts

function enter-psscripts {
	Set-Location psscripts:/
	Write-Host "Entering Powershell Scripts: "
}
Set-Alias pss enter-psscripts

function enter-dotconfigs {
	Set-location dotconfigs:/
	Write-Host "Entering .configs: "
}
Set-Alias .con enter-dotconfigs

function move-up {
	Set-location ..
	Echo "Moving Up: "
}
Set-Alias .. move-up

function move-up-two {
	for ($loop = 1; $loop -le 2; $loop++) {
		Set-Location ..
	}
	Write-Host "Moving up twice: "
}
Set-Alias ... move-up-two
