#!/bin/bash

#get the pid for the running process of awesome 
awesome_pid=$(pgrep awesome | head -1)

eval $(tr '\0' '\n' < /proc/${awesome_pid}/environ | sed -e 's/^/export /')

awesome_pid_owner=$(stat -c %U /proc/${awesome_pid})

#enable the widget 
su $awesome_pid_owner \
	-c "echo 'batwidget:set_text(\"$1%\")' | awesome-client"
