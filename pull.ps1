# pull out configs to their needed folders.


# Import Variables
. ".\vars.ps1"

# Starship config
function pull_starship_config {
Copy-Item -Path "$local_config_folder/starship.toml" -Destination "$desktop_config_folder" -Force
}

# Git config
function pull_git_config {
Copy-Item -Path "$local_config_folder/.gitconfig" -Destination "$root" -Force
}

# PowerShell profile
function pull_powershell_profile {
Copy-Item -Path "$local_config_folder\Powershell" -Destination "$documents_folder" -Recurse -Force
}


do {
    Clear-Host
    Write-Host "=== Config pull Menu ===" -ForegroundColor Cyan
    Write-Host "1. pull Starship Config"
    Write-Host "2. pull Git Config"
    Write-Host "3. pull PowerShell Profile"
    Write-Host "4. pull All"
    Write-Host "Q. Quit"
    Write-Host "=========================="
    
    $choice = Read-Host "Choose an option"
    New-Item -ItemType Directory -Path $local_config_folder -Force | Out-Null
    switch ($choice) {
        '1' { pull_starship_config }
        '2' { pull_git_config }
        '3' { pull_powershell_profile }
        '4' { 
            pull_starship_config
            pull_git_config
            pull_powershell_profile
        }
        'Q' { Write-Host "Goodbye!" -ForegroundColor Yellow }
        Default { Write-Host "Invalid option, try again." -ForegroundColor Red }
    }

    if ($choice -ne 'Q') {
        Read-Host "`nPress Enter to return to the menu..."
    }

} until ($choice -eq 'Q')