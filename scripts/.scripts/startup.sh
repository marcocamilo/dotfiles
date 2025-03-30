#!/bin/sh

# Wallpaper
~/.fehbg &

# Compositor (for transparency, shadows)
xcompmgr &

# Transparency effect
transset .50 &

# Polybar
(sleep 2 && polybar) &
