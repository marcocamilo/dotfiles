#!/bin/bash

# Detect active WiFi interface (works for most Linux distros)
INTERFACE=$(iw dev | awk '$1=="Interface"{print $2}')

# Check if connected to WiFi
if [ -z "$INTERFACE" ] || ! iw dev "$INTERFACE" link | grep -q "Connected"; then
  echo "󰖪 None"
    exit 0
fi

# Get the signal strength
SIGNAL=$(iw dev "$INTERFACE" link | awk '/signal:/ {print $2}')

# Determine signal quality percentage
QUALITY=$((100 + SIGNAL))  # Convert dBm to a percentage (rough estimation)

# Define Nerd Font icons for signal strength
if [ "$QUALITY" -ge 80 ]; then
    ICON="󰤨"  # Excellent (Full bars)
elif [ "$QUALITY" -ge 60 ]; then
    ICON="󰤥"  # Good (3 bars)
elif [ "$QUALITY" -ge 40 ]; then
    ICON="󰤢"  # Okay (2 bars)
elif [ "$QUALITY" -ge 20 ]; then
    ICON="󰤟"  # Weak (1 bar)
else
    ICON="󰤯"  # Very weak (0 bars)
fi

# Output WiFi strength
echo "$ICON $QUALITY%"

