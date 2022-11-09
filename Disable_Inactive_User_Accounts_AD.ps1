#THIS PS SCRIPT WILL QUERY AD AND FOR ANY USER ACCOUNTS OLDER THAN 60 DAYS AND PROMPT YOU TO DISABLE AND MOVE THEM TO A DESIGNATED OU

$DaysInactive = 60
$time = (Get-Date).Adddays(-($DaysInactive))
$USERLIST = Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -ResultPageSize 2000 -resultSetSize $null -Properties Name, OperatingSystem, SamAccountName, DistinguishedName, LastLogonDate
foreach ($USER in $USERLIST) {
    Disable-ADAccount -Identity  $users.distinguishedname -verbose -CONFIRM
    Move-ADObject $users.distinguishedname  -TargetPath "OU=DISABLED-USERS,DC=fakedomain,DC=LOCAL" -verbose -CONFIRM
     }