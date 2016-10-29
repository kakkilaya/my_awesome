#!/bin/bash

#this file notifies in case of low battery

#get the running awesome procee
awesome_pid=$(pgrep awesome | head -1)


eval $(tr '\0' '\n' < /proc/${awesome_pid}/environ | sed -e 's/^/export /')

awesome_pid_owner=$(stat -c %U /proc/${awesome_pid})

#gnerate and send notifcation 
su $awesome_pid_owner -c "notify-send 'low battery'"
