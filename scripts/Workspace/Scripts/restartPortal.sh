#!/usr/bin/env bash
sleep 1
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal-wlr
killall -e xdg-desktop-portal-gtk
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
/usr/lib/xdg-desktop-portal-gtk &
sleep 2
/usr/lib/xdg-desktop-portal &
