#!/bin/bash
bwp

dunstmerge

xrdb -merge ~/.Xresources

polybar-msg cmd restart
conmanmsg reload

#kill -HUP $(pidof dwm)

xsetroot -name "fsignal:1"

killall -v -USR1 st cava
killall -v dunst
killall xeyes && xeyes +shape -outline "$(mondo -c bg)" &

#i3listen.py > /dev/null&

dunst -q &

#codereload

#i3fyra -l 'AB=-450 BD=300 AC=171'
xsetroot -name "fsignal:1"

filesort &
killall xob
tail -f /tmp/xobb | xob -m 3000 -s backlight &

volume-watcher | xob &
mic-watcher | xob -s mic &
picom --experimental-backend
