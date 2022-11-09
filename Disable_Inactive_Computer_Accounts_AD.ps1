#THIS PS SCRIPT WILL QUERY AD AND FOR ANY COMPUTER ACCOUNT OLDER THAN 60 DAYS AND PROMPT YOU TO DISABLE AND MOVE THEM TO A DESIGNATED OU

$DaysInactive = 60
$time = (Get-Date).Adddays(-($DaysInactive))
$ComputerList = Get-ADComputer -Filter Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -ResultPageSize 2000 -resultSetSize $null -Properties Name, OperatingSystem, SamAccountName, DistinguishedName, LastLogonDate
foreach ($Computer in $ComputerList) {
    Disable-ADAccount -Identity  $Computer.name -verbose -confirm
    Move-ADObject $Computer.distinguishedname  -TargetPath "OU=DISABLEDCOMPUTERS,DC=fakedomain,DC=LOCAL" -verbose -confirm 