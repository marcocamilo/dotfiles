#!/bin/bash

IGNORE_FILE="$HOME/.config/fd/ignore"

# Build fd ignore args if file exists
FD_ARGS=()
if [ -f "$IGNORE_FILE" ]; then
    while IFS= read -r line; do
        [ -n "$line" ] && FD_ARGS+=("-E" "$line")
    done < "$IGNORE_FILE"
fi

# Step 1: Get search query
QUERY=$(echo "Enter a query to search current directory" | dmenu -p "File Search:")
[ -z "$QUERY" ] && exit 0   # Exit if empty (Esc pressed)

# Step 2: Collect results (basename + full path)
RESULTS=$(fd "${FD_ARGS[@]}" "$QUERY" ~ | while read -r f; do
    base=$(basename "$f")
    dir=$(basename "$(dirname "$f")")
    echo -e "$dir/$base\t$f"
done)
[ -z "$RESULTS" ] && exit 0   # Exit if no matches

# Step 3: Pick one result (show only first column in menu)
CHOICE=$(echo "$RESULTS" | cut -f1 | dmenu -p "Results:")
[ -z "$CHOICE" ] && exit 0   # Exit if empty (Esc pressed)

# Step 4: Map choice back to full path
FILE=$(echo "$RESULTS" | awk -F'\t' -v choice="$CHOICE" '$1 == choice {print $2; exit}')
[ -z "$FILE" ] && exit 0   # Exit if something went wrong

# Step 5: Open file
xdg-open "$FILE" >/dev/null 2>&1 &
