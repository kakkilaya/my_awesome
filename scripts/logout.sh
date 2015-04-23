#!/bin/bash

ACTION=$(zenity --width=90 \
	--height=200 \
	--list --radiolist \
	--text="Select logout action" \
	--title="Logout" \
	--column="choice" \
	--column="action" \
	--hide-header \
	TRUE Shutdown \
	FALSE Reboot \
	FALSE Suspend \
	2>/dev/null)

if [ -n "${ACTION}" ]; then
	case $ACTION in
		Shutdown)
			systemctl poweroff
			;;
		Reboot)
			systemctl reboot
			;;
		Suspend)
			systemctl suspend
			;;
	esac
fi
