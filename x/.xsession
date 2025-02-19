#!/bin/sh
# Source ~/.xprofile to set up the environment
if [ -f ~/.xprofile ]; then
    . ~/.xprofile
fi

# Start the window manager
while true; do
  dwm 2> ~/.dwm.log
done
