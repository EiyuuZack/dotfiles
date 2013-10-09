#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# must be exported here to make xdg-open work properly (chromium's 'open')
export DE=xfce

# GTK fix for Qt applications (must be exported here apparently)
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# must be done before starting X
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# start vbox services for screen resizing and shared clipboard
# uncomment only when archlinux is running as the guest os
#VBoxClient-all &
VBoxClient --display
VBoxClient --clipboard

# run systemd as user instance
systemd --user &

exec openbox-session
