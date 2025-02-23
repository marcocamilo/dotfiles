#!/bin/sh

# Prompt the user with dmenu
choice=$(echo -e "YES\nNO" | dmenu -i -p "Do you want to LOGOUT?")

# If the user confirms, execute the logout command
if [ "$choice" = "YES" ]; then
    pkill -u "$USER"
fi

