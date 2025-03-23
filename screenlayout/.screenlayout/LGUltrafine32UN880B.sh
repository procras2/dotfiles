#!/bin/bash
# Screenlayout ofr .#LGUltrafine32UN880B
# UHD 4K 16:9 monitor 3840 x 2160
# We will set Xft.dpi to 96 * 2 = 192 (double the normal one) in .Xresources
# We will use xrandr to change the Scaling

# This script will be called by the i3 config file
# exec --no-startup-id ~/.screenlayout/LGUltrafine32UN880B.sh

# Remember we can set things back to normal with
# $ xrandr --auto

xrandr --output DP-3 --auto --scale 1.33333333333x1.33333333333
