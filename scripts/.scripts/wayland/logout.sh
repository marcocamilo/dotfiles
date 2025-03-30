#!/bin/bash

# Ask the user if they want to log off using wmenu
CHOICE=$(echo -e "Yes\nNo" | wmenu -p "Do you want to log off?")

# If the choice is "Yes", execute killp dwl
if [ "$CHOICE" == "Yes" ]; then
    pkill dwl
fi

