function google-search {
	$searchString = ($args -join ' ')
	$encodedSearch = [System.Uri]::EscapeDataString($searchString)
	start "https://www.google.com/search?q=$encodedSearch"
}
Set-Alias google google-search
Set-Alias ggl google-search
