#!/bin/bash
ARTIST=$(playerctl metadata artist -s)
TITLE=$(playerctl metadata title -s)
if [ "$ARTIST" = "" ]; then
  echo ""
fi
echo "%{F#55aa55} %{F-} $ARTIST - $TITLE"
