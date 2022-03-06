#!/bin/bash
while true; do
  ARTIST=$(playerctl metadata artist -s)
  TITLE=$(playerctl metadata title -s)
  PLAYING=$(playerctl status -s)
  if [ "$ARTIST" = "" ]; 
  then
    echo ""
  else
    echo "$ARTIST - $TITLE"
  fi
  sleep 1
done
