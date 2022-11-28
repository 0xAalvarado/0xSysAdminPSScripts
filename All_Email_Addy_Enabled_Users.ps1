Get-ADUser -Filter * -Properties * | select PrimarySMTPAddress, DisplayName, samaccountname | where-object {$_.enabled -eq $True} | Export-CSV "C:\Ad_user_email_Address.csv"