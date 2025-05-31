#!/bin/bash

# Detect active WiFi interface
INTERFACE=$(iw dev | awk '$1=="Interface"{print $2}')

# Check if connected
if [ -z "$INTERFACE" ] || ! iw dev "$INTERFACE" link | grep -q "Connected"; then
    echo "󰖪 None"
    exit 0
fi

# Get signal strength in dBm
SIGNAL_DBM=$(iw dev "$INTERFACE" link | awk '/signal:/ {print $2}')

# Convert dBm to quality (approximate mapping)
# -30 dBm => 100%
# -50 dBm => ~80%
# -60 dBm => ~60%
# -70 dBm => ~40%
# -80 dBm => ~20%
# -90 dBm or lower => 0%
if [ "$SIGNAL_DBM" -ge -50 ]; then
    QUALITY=100
elif [ "$SIGNAL_DBM" -ge -60 ]; then
    QUALITY=80
elif [ "$SIGNAL_DBM" -ge -70 ]; then
    QUALITY=60
elif [ "$SIGNAL_DBM" -ge -80 ]; then
    QUALITY=40
elif [ "$SIGNAL_DBM" -ge -90 ]; then
    QUALITY=20
else
    QUALITY=0
fi

# Choose icon based on quality
if [ "$QUALITY" -ge 80 ]; then
    ICON="󰤨"
elif [ "$QUALITY" -ge 60 ]; then
    ICON="󰤥"
elif [ "$QUALITY" -ge 40 ]; then
    ICON="󰤢"
elif [ "$QUALITY" -ge 20 ]; then
    ICON="󰤟"
else
    ICON="󰤯"
fi

# Output
echo "$ICON  $QUALITY%"
