#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/wallpapers/"

# List image files in the directory and let user choose one
SELECTED_WALLPAPER=$(ls "$WALLPAPER_DIR" | dmenu)

# If a wallpaper was selected, set it using waypaper
if [ -n "$SELECTED_WALLPAPER" ]; then
    waypaper --wallpaper "$WALLPAPER_DIR/$SELECTED_WALLPAPER"
fi
