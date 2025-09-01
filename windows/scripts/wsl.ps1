
Write-Host "installing WSL default ubuntu"

wsl --install

Write-Host ""
Write-Host "WSL installation steps completed."
Write-Host "After reboot, launch Ubuntu from Start Menu or run 'wsl' in PowerShell."

#start wsl
wsl ~

wsl --status

<DistributionName> config --default-user <Username>
ubuntu config --default-user johndoe


wsl  vim, 