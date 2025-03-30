#!/bin/bash

# Ask the user if they want to log off using dmenu
CHOICE=$(echo -e "Yes\nNo" | dmenu -p "Do you want to shutdown?")

# If the choice is "Yes", execute killp dwl
if [ "$CHOICE" == "Yes" ]; then
    shutdown now
fi

