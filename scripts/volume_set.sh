#!/bin/bash

amixer set Master $1 >/dev/null 2>&1

echo "set_volume(volumelvl)" | awesome-client
