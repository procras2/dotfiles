#!/bin/sh

set -e

# using trap make sure to restore dunst even if something fails
# restore notifications when script ends
# this command is defered when the script ends
trap "dunstctl set-paused false" EXIT

# pause notifications
dunstctl set-paused true


# https://www.reddit.com/r/i3wm/comments/9089o2/turn_off_screen_after_a_moment_if_locked/?rdt=63250

img=/tmp/i3lock.png
scrot -o $img
convert $img -scale 10% -scale 1000% $img

# enable the lockscreen
i3lock --nofork -c 272d2d -i $img &

while [ $(pgrep i3lock | wc -l ) -ne 0 ];
do
    sleep 420
    xset dpms force off
done
