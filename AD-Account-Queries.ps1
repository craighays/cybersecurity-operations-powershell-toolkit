# Pastbin Dump Checks

# Get $user account by email address in CSV file and:
## check if the account is enabled
## check when the password was last changed
## check if password is set to never expire
## write the output to a csv

ForEach($user in (Import-CSV -path c:\input.csv)){
  $email = $user.email
  Get-ADuser -Filter {(EmailAddress -eq $email)} -properties Enabled, passwordlastset, passwordneverexpires |select Name, Enabled, passwordlastset, Passwordneverexpires | Export-CSV -path c:\output.csv
}
