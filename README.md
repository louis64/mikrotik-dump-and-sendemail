# mikrotik-dump-and-sendemail
This script creates a dump and sends it to email.

# More

1. Creates dump with name in format {year}-{month}-{day}_{name_mikrotik}_({hour}-{minute}-{second}).backup
2. Creates dump this name lastDump.backup and if it exists then replaces it.
3. Send current dump to email list  
4. Deletes a submitted dump

# How to use
The following params must be configured
1. Mailbox from where letters will be sent
```
:local emailFrom "email@domain.com" #
:local emailPass "your_pass"
:local emailSMTP "smtp.server.com"
:local emailPORT "465"
```
2. Email box for receiver 
```
:local emailsTo "email1@domain.com;email2@domain.com;email3@domain.com"
```
3. If need you may add this script to scheduler 
