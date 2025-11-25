function clear-cat {
	Clear-Host
	Get-Content @args
}
Set-Alias cc clear-cat
