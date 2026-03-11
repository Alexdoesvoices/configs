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

function mint-ssh {
	ssh arobinson@192.168.68.65
}
Set-Alias msh mint-ssh

function cat-profile {
	clear
	cat $profile
}
Set-Alias cpro cat-profile

function quick-git-init {
	git init
	git add .
	git commit -m "Inital Commit"
}
Set-Alias gitinit quick-git-init


function bun-b {
	bun @args
}
Set-Alias b bun-b

function bun-dev {
	bun run dev 
}
Set-Alias bd bun-dev

function bun-dev-open {
	bun run dev --open
}
Set-Alias bdo bun-dev-open
