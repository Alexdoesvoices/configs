# Create an array of application names
$apps = @(
    "discord",
    "ditto",
    "fastfetch",
    "firefox",
    "flow-launcher",
    "googledrive",
    "micro",
    "nodejs",
    "python",
    "ruby",
    "starship",
    "vivaldi",
    "vscode"
)

# Loop through each application and upgrade it
foreach ($app in $apps) {
    Write-Host "Upgrading $app..." -ForegroundColor Green
    choco upgrade $app -y
    Write-Host "Finished upgrading $app." -ForegroundColor Green
}

Write-Host "All specified applications have been upgraded." -ForegroundColor Cyan