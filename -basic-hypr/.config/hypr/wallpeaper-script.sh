#!/usr/bin/env bash

WALLPEAPER_DIR="$HOME/Pictures/wallpeaper/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

WALLPEAPERS=$(find "$WALLPEAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf)
MONITORS=$(hyprctl monitors -j | jq -r '.[].name')

WALLPEAPER=$(find "$WALLPEAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
mapfile -t WALL_ARRAY <<<"$WALLPEAPERS"

i=0
for MONITOR in $MONITORS; do
  PICTURE="${WALL_ARRAY[$i]}"
  hyprctl hyprpaper reload "$MONITOR","$PICTURE"
  ((i++))
done
