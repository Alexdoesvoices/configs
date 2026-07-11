# Pulls in config files from various places


# Import Variables
. ".\vars.ps1"


function copy_starship_config {
    Copy-Item -Path "$Desktop_config_folder/starship.toml" -Destination "$local_config_folder" -Force
}


function copy_git_config {
    Copy-Item -Path "$root\.gitconfig" -Destination "$local_config_folder" -Force
}

function copy_powershell_profile {
Copy-Item -Path "$powershell_profile" -Destination "$local_config_folder" -Recurse -Force 
}


do {
    Clear-Host
    Write-Host "=== Config Backup Menu ===" -ForegroundColor Cyan
    Write-Host "1. Backup Starship Config"
    Write-Host "2. Backup Git Config"
    Write-Host "3. Backup PowerShell Profile"
    Write-Host "4. Backup All"
    Write-Host "Q. Quit"
    Write-Host "=========================="
    
    $choice = Read-Host "Choose an option"
    New-Item -ItemType Directory -Path $local_config_folder -Force | Out-Null
    switch ($choice) {
        '1' { copy_starship_config }
        '2' { copy_git_config }
        '3' { copy_powershell_profile }
        '4' { 
            copy_starship_config
            copy_git_config
            copy_powershell_profile
        }
        'Q' { Write-Host "Goodbye!" -ForegroundColor Yellow }
        Default { Write-Host "Invalid option, try again." -ForegroundColor Red }
    }

    if ($choice -ne 'Q') {
        Read-Host "`nPress Enter to return to the menu..."
    }

} until ($choice -eq 'Q')