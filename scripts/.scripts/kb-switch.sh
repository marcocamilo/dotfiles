#!/bin/bash

# Define the keyboard layouts
LAYOUTS=("us" "us(intl)" "ru(phonetic_mac)")

# Get the current layout
CURRENT_LAYOUT=$(setxkbmap -query | awk '/layout:/ {print $2}')
VARIANT=$(setxkbmap -query | awk '/variant:/ {print $2}')

# Format the current layout string to match the array entries
if [[ "$CURRENT_LAYOUT" == "us" && "$VARIANT" == "intl" ]]; then
    CURRENT_LAYOUT="us(intl)"
elif [[ "$CURRENT_LAYOUT" == "ru" && "$VARIANT" == "phonetic_mac" ]]; then
    CURRENT_LAYOUT="ru(phonetic_mac)"
fi

# Find the index of the current layout
CURRENT_INDEX=-1
for i in "${!LAYOUTS[@]}"; do
    if [[ "${LAYOUTS[$i]}" == "$CURRENT_LAYOUT" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

# Determine the next layout
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#LAYOUTS[@]} ))
NEXT_LAYOUT="${LAYOUTS[$NEXT_INDEX]}"

# Apply the next layout
case "$NEXT_LAYOUT" in
    "us")
        setxkbmap us
        ;;
    "us(intl)")
        setxkbmap us -variant intl
        ;;
    "ru(phonetic_mac)")
        setxkbmap ru -variant phonetic_mac
        ;;
esac
