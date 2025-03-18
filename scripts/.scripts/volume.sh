#!/bin/sh

# Get volume and mute status
VOLUME_OUTPUT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOLUME=$(echo "$VOLUME_OUTPUT" | awk '{print $2 * 100}')
MUTED=$(echo "$VOLUME_OUTPUT" | grep -o "MUTED")

# Determine icon
if [ "$MUTED" = "MUTED" ]; then
    ICON="󰖁 "  # NF icon for muted
    VOLUME=" 0"
elif [ "$VOLUME" -lt 30 ]; then
    ICON=" "  # Low volume
else
    ICON=" "  # High volume
fi

# Print output for dwlb
echo "$ICON ${VOLUME%%%.*}%"
