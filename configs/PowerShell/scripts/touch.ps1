function touch-file($file) {
	"" | Out-File $file -Encoding ASCII
}
Set-Alias touch touch-file
