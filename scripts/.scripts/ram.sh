#!/bin/bash

# Get the total and used RAM
total_ram=$(free -m | awk '/^Mem:/ {print $2}')
used_ram=$(free -m | awk '/^Mem:/ {print $3}')

# Calculate the percentage of RAM used
ram_percent=$(( (used_ram * 100) / total_ram ))

# Output the RAM usage as a percentage
echo " $ram_percent%"

