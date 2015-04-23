#!/bin/bash

volume=$(amixer sget Master \
	| grep -Eo '[[:digit:]]{1,3}%' \
	| head -n 1 \
	| tr -d '%')

value=$(zenity --scale \
	--value="$volume" \
	--min-value="0" \
	--max-value="100" \
	--step="5" \
	2>/dev/null)

$HOME/.config/awesome/scripts/volume_set.sh $value% > /dev/null 2>&1
