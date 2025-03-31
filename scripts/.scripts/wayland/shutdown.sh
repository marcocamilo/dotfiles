#!/bin/bash

# Ask the user if they want to log off using wmenu
CHOICE=$(echo -e "Yes\nNo" | wmenu -p "Do you want to shutdown?")

# If the choice is "Yes", execute killp dwl
if [ "$CHOICE" == "Yes" ]; then
    shutdown now
fi

