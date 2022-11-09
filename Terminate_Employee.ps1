# GET USERNAME OF EMPLOYEE TO BE TERMED
$termuser = read-host "ENTER THE USERNAME OF THE PERSON TO BE TERMINATED"

# MOVE THE AD USER ACCOUNT TO THE DESIGNATED OU 
Get-ADuser $termuser | Move-ADuser -TargetPath "OU=DISABLED-USERS,DC=fakedomain,DC=LOCAL" -verbose -confirm 

# DISABLE THE AD USER ACCOUNT 
Disable-ADuser -Identity  $termuser -verbose -confirm 

# ADD DESCRIPTION TO TERMINATED USER "TERMINATED XX.XX.XX - CURRENT USER"
$terminatedby = $env:username
$termDate = get-date -uformat "%m.%d.%YY"
$termUserDesc = "Terminated " + $termDate + " - " + $terminatedby
set-ADUser $termuser -Description $termUserDesc 
write-host "* " $termuser "description set to" $termUserDesc"

Write-host " THE USER $termuser HAS BEEN TERMINATED BY THE T-1000 CYBERDYNE SYSTEMS TERMINATOR "
