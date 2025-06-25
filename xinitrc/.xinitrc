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

# Xkbmap settings
# only for Xorg, not for Wayland
# -layout us,ie                  Keyboard language layouts to cycle through us ANSI, ie Irish, uk Ukranian or GB
#
# If you need multiple options prceed each by -option
# -option ctrl:nocaps            Disable the caps lock key and use it <ctrl>
# -option grp:win_space_toggle   Use <Win><SPACE> to cycle languages
# -option grp:ctrl_shift_toggle  Uset <CTRL><SHIFT> to cycle languages
# setxkbmap -layout us,ie  -option ctrl:nocaps -option grp:ctrl_shift_toggle
# setxkbmap -layout us,ie -option ctrl:nocaps -option grp:win_space_toggle
setxkbmap -layout us,ie -option ctrl:nocaps

# Dpms settings
# turn off dpms
# xset -dpms
# standby in 100 seconds
# suspend in 200 seconds
# turn off in 300 seconds
#xset dpms 100 200 300
xset dpms 100 200 0

# Xscreensaver
# Screen saver off
# xset s off
# noblank show x pattern, blank, blank screen
#xset s noblank

#
# Turn screen off
# xset dpms force off
#
# Suspend
# xset dpms force suspend
#
# Standby (quick resume)
# xset dpms force standby
#
# Turn on the screensaver
# xset s activate, remember to do sleep 1 & xset s activate if using the console
#
# To turn monitor on
# xset dpms force on; xset s reset

# set the background or put this in ~/.config/i3/config
# ~/.fehbg &

# Check that this is not also set in .config/i3/config
# xss-lock -- i3lock -n -i /home/adrian/.config/backgrounds/nice-blue-background.png &

# env variables for GDK apps
# HiDPI 192
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5
# Normal dpi 96
#export GDK_SCALE=1
#export GDK_DPI_SCALE=1

exec i3
