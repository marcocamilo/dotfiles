#!/bin/bash
df -h / | awk 'NR==2 {print " " $3}'
# df -h / | awk 'NR==2 {print " " $3 "/" $2}'
