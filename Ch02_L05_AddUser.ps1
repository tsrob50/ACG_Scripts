##################################################
# Add AD Users
##################################################

# Set values for your environment
$numUsers = "10"
$userPrefix = "dotLocalUser"
$passWord = "P@ssword!"
$userDomain = "wizbangbananas.local"

# Import the AD Module
Import-Module ActiveDirectory

# Convert the password to a secure string
$UserPass = ConvertTo-SecureString -AsPlainText "$passWord" -Force

#Add the users
for ($i=0; $i -le $numUsers; $i++) {
$newUser = $userPrefix + $i
New-ADUser -name $newUser -SamAccountName $newUser -UserPrincipalName $newUser@$userDomain -GivenName $newUser -Surname $newUser -DisplayName $newUser `
-AccountPassword $userPass -ChangePasswordAtLogon $false -PasswordNeverExpires $true -Enabled $true
}




##################################################
# Link to IDFix
# https://docs.microsoft.com/en-us/office365/enterprise/install-and-run-idfix
##################################################




##################################################
# Update UPN
##################################################
$userDomain = "wizbangbananans.local"
$altDomain = "wizbangbananas.com"

$findDomain = "*$userDomain"
$LocalUsers = Get-ADUser -Filter {UserPrincipalName -like $findDomain} -Properties userPrincipalName -ResultSetSize $null
$LocalUsers | foreach {$newUpn = $_.UserPrincipalName.Replace("$userDomain","$altDomain"); $_ | Set-ADUser -UserPrincipalName $newUpn}

