function Split-Terminal-Verticle {
    $currentDir = Convert-Path (Get-Location)
    Clear-Host
    wt -w 0 sp -d "$currentDir" powershell
}
set-Alias spv Split-Terminal-Verticle

function Split-Terminal-Horizontal {
    $currentDir = Convert-Path (Get-Location)
    Clear-Host
    wt -w 0 sp -H -d "$currentDir" powershell
}
set-Alias sph Split-Terminal-Horizontal
