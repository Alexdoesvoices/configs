New-PSDrive -Name "Dev" -PSProvider "FileSystem" -Root "C:\Users\$Env:UserName\Documents\dev"
New-PSDrive -Name "Dev Projects" -PSProvider "FileSystem" -Root "C:\Users\$Env:UserName\Documents\dev\projects"
New-PSDrive -Name "Psfolder" -PSProvider "FileSystem" -Root "C:\Users\$Env:UserName\Documents\PowerShell"

function enter-root
{
    Write-Host "Returning to Root: "
    Cd ~
}
Set-Alias home enter-root

function enter-dev
{
    Write-Host "Enter Dev: "
    Cd Dev:/
}
Set-Alias dev enter-dev

function enter-devp
{
    Write-Host "Entering Dev Projects: "
    Cd 'Dev Projects:/'
}
Set-Alias dep enter-devp
Set-Alias dec enter-devp
Set-Alias devp enter-devp

function enter-dev-ls
{
    Cd 'Dev Projects:/'
    clear
    Write-Host "Entering Dev: "
    ls
}
Set-Alias des enter-dev-ls

function enter-psfolder
{
    Write-Host "Entering Psfolder:"
    Cd psfolder:/
}
Set-Alias psfolder enter-psfolder

function move-up
{
    Write-Host "Moving Up: "
    cd ..
}
Set-Alias .. move-up

function move-up-two
{
    Write-Host "Moving up twice: "
    for ($loop = 1; $loop -le 2; $loop++)
    {
        cd ..
    }
}
Set-Alias ... move-up-two


function project-changedir
{
    Write-Host "Entering Projects Folder: "
    Cd ~\Documents\dev\projects\
}
Set-Alias projects project-changedir

function project-portfolio
{
    Write-Host "Entering Portfolio Project:"
    Cd ~\Documents\dev\projects\personal\webapps\alexrobinson-portfolio
}
Set-Alias portfolio project-portfolio

function enter-configs-repo {
    Write-Host "Entering Configs Repo:"
    CD C:\Users\$Env:UserName\Documents\dev\projects\personal\other\configs
}
Set-Alias configs enter-configs-repo
