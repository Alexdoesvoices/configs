function micro-shortcut {
	micro @args
}
Set-Alias me micro-shortcut

function gitp {
	git pull
}

function get-fullpath {
	Echo "Full Path: "
	Echo "----------"
	Convert-Path (Get-Location)
}
Set-Alias fpwd get-fullpath

function fedora-ssh {
	ssh arobinson@192.168.68.82
}
Set-Alias fsh fedora-ssh

function cat-profile {
	clear
	cat $profile
}
Set-Alias cpro cat-profile
