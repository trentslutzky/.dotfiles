#!/usr/bin/env bash

URL=$(playerctl metadata mpris:artUrl)
IFS='/' read -ra SPLIT <<< "$URL"
NAME=${SPLIT[4]}
FILE=$HOME/.config/eww/scripts/art_$NAME

if [[ -f "$FILE" ]]; then
  echo $FILE
else
  rm $HOME/.config/eww/scripts/art_*
  echo "GENERATE"
  wget $URL -O $HOME/.config/eww/scripts/art_$NAME -q
  echo $FILE
fi
