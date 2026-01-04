#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpeaper"

# Get currently loaded wallpapers (paths only)
CURRENT_WALLS=$(hyprctl hyprpaper listloaded | awk '{print $2}')

# Get monitors
mapfile -t MONITORS < <(hyprctl monitors -j | jq -r '.[].name')

# Get shuffled wallpapers excluding current ones
mapfile -t WALLPAPERS < <(
  find "$WALLPAPER_DIR" -type f \
    $(printf '! -path %q ' $CURRENT_WALLS) | shuf
)

i=0
for MONITOR in "${MONITORS[@]}"; do
  WALL="${WALLPAPERS[$i]}"

  [[ -z "$WALL" ]] && break

  hyprctl hyprpaper preload "$WALL"
  hyprctl hyprpaper wallpaper "$MONITOR,$WALL"

  ((i++))
done
