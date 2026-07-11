function Set-GoVersion {
    param(
        # Changed Mandatory to $false so it doesn't automatically throw a default prompt
        [Parameter(Mandatory=$false)]
        [string]$Version
    )

    # If no version was passed as an argument, fetch the list and ask for input
    if ([string]::IsNullOrEmpty($Version)) {
        Write-Host "--- Available Go Versions (mise) ---" -ForegroundColor Yellow
        mise ls go
        Write-Host "------------------------------------" -ForegroundColor Yellow
        
        $Version = Read-Host "Enter the Go version you want to use"
    }

    # Exit early if the user just hits enter without typing anything
    if ([string]::IsNullOrEmpty($Version)) {
        Write-Warning "No version specified. Aborting."
        return
    }

    Write-Host "Updating go.mod to $Version..." -ForegroundColor Cyan
    go mod edit -go $Version

    Write-Host "Updating mise.toml to go@$Version..." -ForegroundColor Cyan
    mise use go@$Version

    Write-Host "Ensuring Go $Version is installed..." -ForegroundColor Cyan
    mise install

    Write-Host "Refreshing active terminal environment..." -ForegroundColor Green
    mise env pwsh | Invoke-Expression
}

Set-Alias go-version Set-GoVersion
