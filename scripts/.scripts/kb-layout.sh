#!/bin/bash

# Get the current layout and variant
CURRENT_LAYOUT=$(setxkbmap -query | awk '/layout:/ {print $2}')
VARIANT=$(setxkbmap -query | awk '/variant:/ {print $2}')

# Append variant if present
if [[ -n "$VARIANT" ]]; then
    CURRENT_LAYOUT="${CURRENT_LAYOUT}-${VARIANT}"
fi

echo "  $CURRENT_LAYOUT"
