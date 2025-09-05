param([switch]$Elevated)
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit 1
}

# !Install the Chocolaty Package Manager:
# TODO: UnComment Following Line:
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


# Checks if Chocolaty properly installed if not it breaks:
try {
    # Attempt to get the version of choco. This will throw an error if choco is not found.
    choco --version | Out-Null
    Write-Host "Chocolatey is installed and working." -ForegroundColor Green
}
catch {
    Write-Host "Error: The 'choco' command was not recognized." -ForegroundColor Red
    Write-Host "Please check your Chocolatey installation." -ForegroundColor Yellow
    
    # Exit the script with an error code
    exit 1 
}


# ! Choco Install Script
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


#! Create an array of global Node.js package names
$packages = @(
    "ember-cli",
    "live-server"
    # Add any other packages you want to install or update here
)

# Loop through each package and install/update it globally
foreach ($package in $packages) {
    Write-Host "Upgrading $package..." -ForegroundColor Green
    npm install -g $package
    Write-Host "Finished upgrading $package." -ForegroundColor Green
}

Write-Host "All specified global Node.js packages have been upgraded." -ForegroundColor Cyan


#? Get User input for Git Username and Email:
$GitName = Read-Host "What is your Git Username"
$GitEmail = Read-Host "What is your Git Email"


# ! Configure Git Username and Email:
# TODO: UnComment Following Lines:
# git config --global user.name '$GitName'
# git config --global user.email '$GitEmail'

#? Changes Directory To Downloads and Clones the Configs Repository:
Set-Location "$HOME\Downloads"
git clone https://www.github.com/alexdoesvoices/configs

# TODO: UnComment Following Lines:
# Copy-Item -Path "$HOME\Downloads\configs\.config" -Destination "$Home\" -Recurse -Force


# TODO ! Copy Powershell Profile to Location:
# TODO: Uncomment the Line belowl:
# Copy-Item -Path "$HOME\Downloads\configs\Powershell & Powershell Scripts\Profile\Microsoft.PowerShell_profile.ps1" -Destination "$Home\Documents\WindowsPowerShell\" -Force

# ! Clone Git Configs:









Pause