function chris-titus-tool {
	irm christitus.com/win | iex
}
Set-Alias cwt chris-titus-tool

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

function bun-b {
	bun @args
}
Set-Alias b bun-b

function pnpm-shortcut {
	pnpm @args
}
Set-Alias pp pnpm-shortcut



function Get-ChocoTable {
    choco list -l -r | ForEach-Object {
        $name, $version = $_ -split '\|'
        [PSCustomObject]@{
            PackageName = $name
            Version     = $version
        }
    } | Out-GridView # Or use Format-Table -AutoSize
}
Set-Alias chocogrid Get-ChocoTable
