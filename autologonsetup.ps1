$Username = Read-Host 'Enter username for auto-logon'
$Pass = Read-Host "Enter password for $Username"
$Domain = Read-Host 'Enter the Domain of your Organization'
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
Set-ItemProperty $RegistryPath 'AutoAdminLogon' -Value "1" -Type String 
Set-ItemProperty $RegistryPath 'DefaultUsername' -Value "$Username" -type String 
Set-ItemProperty $RegistryPath 'DefaultPassword' -Value "$Pass" -type String
set-Itemproperty $RegistryPath 'DefaultDomainName' -Value "$Domain" -type String 