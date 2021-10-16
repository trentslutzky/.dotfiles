#!/bin/sh
ARTIST=$(playerctl metadata artist)
TITLE=$(playerctl metadata title)
echo "%{F#55aa55} %{F-} $ARTIST - $TITLE"
