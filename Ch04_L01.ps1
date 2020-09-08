#Install the management module:
Install-module MSOnline


#Connect to MSOLServcie
Connect-msolservcie
#Log in with your global admin account.

#Disable directory synchronization:
Set-MsolDirSyncEnabled -EnableDirSync $false

#Verify if synchronization is disable, it should show $false
(Get-MSOLCompanyInformation).DirectorySynchronizationEnabled
