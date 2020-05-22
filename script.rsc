/log info "emailDUMP:start send dump"
###################################################
# SEND DUMP TO EMAILS ###################################
###################################################
# SETTINGS SCRIPT
:local emailFrom "email@domain.com"
:local emailPass "your_pass"
:local emailSMTP "smtp.domain.com"
:local emailPORT "465"

# >>>>>> LIST EMAILS FOR SEND <<<<< # EXAMPLE : email@domain.ru, email2@domain.ru, email3@domain.ru
:local emailsTo "email@domain.com"

# SET SETTINGS
/tool e-mail set address="$emailSMTP" port="$emailPORT" user="$emailFrom"  from="$emailFrom" password="$emailPass" start-tls="yes"

/log info "emailDUMP:set send cfg"

:delay 2s
###################################################
###################################################
:local dateFull [/system clock get date] 
:local year [ :pick $dateFull  7 11 ]
:local dia [ :pick $dateFull 4 6 ]
:local mes [ :pick $dateFull 0 3 ]

:local timeFull  [/system clock get time] 
:local timeH   [ :pick $timeFull 0 2 ] 
:local timeM  [ :pick $timeFull 3 5 ] 
:local timeS   [ :pick $timeFull 6 8 ]  

:local thisbox [/system identity get name]

:local dateTimeCreate  "$year-$mes-$dia_$thisbox_($timeH-$timeM-$timeS)"
:global backupFileName "$dateTimeCreate.backup"

/log info "emailDUMP:start dump file"
/system backup save name=$backupFileName
/system backup save name="lastDump.backup"

:delay 5s

/log info "emailDUMP:send files"
# START SEND TO EMAILS LIST 
