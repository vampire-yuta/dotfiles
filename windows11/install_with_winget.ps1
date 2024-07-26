# Install Packages
cd winget
winget import winget.json

# Put profilie.ps
Copy-Item -Path profile.ps1 -Destination $HOME\Documents\PowerShell\profile.ps1 -Force
