#!/bin/sh

set -e

# using trap make sure to restore dunst even if something fails
# restore notifications when script ends
# this command is defered when the script ends
trap "dunstctl set-paused false" EXIT

# pause notifications
dunstctl set-paused true

# enable the lockscreen
i3lock --nofork -c 272d2d -i /home/adrian/.config/backgrounds/nice-blue-background.png

