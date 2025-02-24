#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*. ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Here we diable the horrible caps lock key
# setxkbmap -layout us,ie  -option grp:win_space_toggle ctrl:nocaps
# setxkbmap -layout us,ie  -option ctrl:nocaps -option grp:ctrl_shift_toggle
setxkbmap -layout us,ie -option ctrl:nocaps -option grp:win_space_toggle

# Screen saver off
xset s off

# and dpms to turn off the monitor
xset -dpms

# set the background or put this in ~/.config/i3/config
# ~/.fehbg &

xss-lock -- i3lock -n -i /home/adrian/.config/backgrounds/nice-blue-background.png &

exec i3
