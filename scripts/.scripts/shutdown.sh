#!/bin/sh

# Prompt the user with dmenu
choice=$(echo -e "YES\nNO" | dmenu -i -p "Do you want to SHUTDOWN?")

# If the user confirms, execute the shutdown command
if [ "$choice" = "YES" ]; then
    poweroff
fi

