#!/bin/bash

# Define the keyboard layouts
LAYOUTS=(
  "us"
  "us(intl)"
  # "ru(phonetic_mac)"
)

# Get current layout and variant
CURRENT_LAYOUT=$(setxkbmap -query | awk '/layout:/ {print $2}')
VARIANT=$(setxkbmap -query | awk '/variant:/ {print $2}')

# Normalize layout string
if [[ -n "$VARIANT" ]]; then
    CURRENT_LAYOUT="${CURRENT_LAYOUT}(${VARIANT})"
fi

# Find index of current layout
CURRENT_INDEX=-1
for i in "${!LAYOUTS[@]}"; do
    if [[ "${LAYOUTS[$i]}" == "$CURRENT_LAYOUT" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

# If current layout not found, default to first
if [[ $CURRENT_INDEX -lt 0 ]]; then
    CURRENT_INDEX=0
fi

# Determine next layout
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#LAYOUTS[@]} ))
NEXT_LAYOUT="${LAYOUTS[$NEXT_INDEX]}"

# Apply next layout
case "$NEXT_LAYOUT" in
    "us")
        setxkbmap us -variant ""
        ;;
    "us(intl)")
        setxkbmap -layout us -variant intl
        ;;
    "ru(phonetic_mac)")
        setxkbmap -layout ru -variant phonetic_mac
        ;;
esac
