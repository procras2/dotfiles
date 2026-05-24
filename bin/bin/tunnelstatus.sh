#!/bin/bash
# Script to start an ssh tunnel to eilise

if [ -e /tmp/tunnel.pid ]
then
  zenity --info --text "Tunnel is UP"
  exit 1
else
  zenity --error --text "Tunnel is DOWN"
  exit 1
fi

