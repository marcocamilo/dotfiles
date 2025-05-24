#!/bin/sh

# Source profile for environment variables
if [ -f ~/.xprofile ]; then
    . ~/.xprofile
fi

# Start shared background applications
~/.scripts/startup.sh &
