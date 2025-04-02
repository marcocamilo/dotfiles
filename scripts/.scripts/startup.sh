#!/bin/sh

# Wallpaper
~/.fehbg &

# Compositor (for transparency, shadows)
xcompmgr &

# Transparency effect
transset .50 &

# Dunst
dunst &

# pCloud
/home/marcocamilo/opt/pcloud &

# Polybar
(sleep 2 && polybar) &
