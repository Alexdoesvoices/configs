function clear-ls {
	Clear-Host
	Get-ChildItem @args
<#
.DESCRIPTION
	Clears the screen and list directory content. 
#>
	
}
set-alias clls clear-ls
