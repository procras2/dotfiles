#!/bin/sh

# Set device to be toggled
HYPRLAND_DEVICE="elan-touchpad"
HYPRLAND_VARIABLE="device[$HYPRLAND_DEVICE]:enabled"

notify-send -u normal "Disabling Touchpad"
hyprctl keyword $HYPRLAND_VARIABLE false
