#!/bin/sh

TEXT='#ffffffff'
dunstctl set-paused true
obs-cli --port 4444 scene switch "AFK"

i3lock \
    -e \
    -t \
    --nofork \
    -i '/home/tls/Scripts/lockbg.jpg' \
    --color='#000000ff'\
    --clock \
    --verif-text='...' \
    --wrong-text='incorrect password' \
    --time-color=$TEXT \
    --date-color=$TEXT \
    --greeter-color=$TEXT \
    --verif-color=$TEXT \
    --wrong-color=$TEXT \
    --time-size=120 \
    --date-size=30 \
    --greeter-size=30 \
    --date-pos='tx:ty+40'\
    --time-font='JetbrainsMono Nerd Font' \
    --date-font='JetbrainsMono Nerd Font' \
    --greeter-font='JetbrainsMono Nerd Font' \
    --verif-font='JetbrainsMono Nerd Font' \
    --wrong-font='JetbrainsMono Nerd Font' \
    --time-str='%H:%M %p' \
    --date-str='%d %B %Y' \
    --bar-indicator \

dunstctl set-paused false
