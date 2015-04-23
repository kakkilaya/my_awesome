#!/bin/bash

amixer set Master toggle >/dev/null 2>&1

echo "volume_toggle(volumebutton)" | awesome-client
