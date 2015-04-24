#!/bin/bash
awesome_pid=$(pgrep awesome | head -1)

eval $(tr '\0' '\n' < /proc/${awesome_pid}/environ | sed -e 's/^/export /')

awesome_pid_owner=$(stat -c %U /proc/${awesome_pid})

su $awesome_pid_owner -c "notify-send 'low battery'"
