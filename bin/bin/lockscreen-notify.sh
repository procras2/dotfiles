#!/bin/bash

set -e

#notify-send --urgency=critical --icon preferences-desktop-screensaver --expire-time=5000 "about to lock screen ..." "move or use corners"

for p in $(seq 0 2 100); do
    dunstify --icon preferences-desktop-screensaver \
	     -h int:value:$p \
	     -h 'string:hlcolor:#ff4444' \
	     -h string:x-dunst-stack-tag:progress-lock \
	     --timeout=500 "about to lock screen ..." "move or use corners"
    sleep 0.05
done

