#!/bin/sh

while true; do
    # dwl -s somebar 2> ~/.dwl.log
    dwl -s 'dwlb -font "monospace:size=12"' 2> ~/.dwl.log &
    # someblocks -p | dwlb -status-stdin all &
    # dwl -s "someblocks -p | dwlb -status-stdin all" 2> ~/.dwl.log
    # dwl 2> ~/.dwl.log
    sleep 1
done
