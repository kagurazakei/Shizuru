#!/bin/bash
# ~/.config/eww/scripts/wallpaper.sh

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CURRENT_WALLPAPER_FILE="$HOME/.cache/current_wallpaper"

# Detect window manager
if [ "$XDG_CURRENT_DESKTOP" = "niri" ]; then
  WALLPAPER_CMD="niri msg dynamic output -w 0 background --image"
elif pgrep -x "hyprland" >/dev/null; then
  WALLPAPER_CMD="swww img --transition-type grow --transition-pos 0.925,0.975 --transition-step 255"
else
  WALLPAPER_CMD="feh --bg-fill"
fi

# Get current wallpaper
get_current_wallpaper() {
  if [ -f "$CURRENT_WALLPAPER_FILE" ]; then
    cat "$CURRENT_WALLPAPER_FILE"
  else
    echo ""
  fi
}

# Set wallpaper
set_wallpaper() {
  echo "$1" > "$CURRENT_WALLPAPER_FILE"
  $WALLPAPER_CMD "$1"
}

# Get random wallpaper
random_wallpaper() {
  local wallpapers=($(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \)))
  if [ ${#wallpapers[@]} -gt 0 ]; then
    local random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"
    set_wallpaper "$random_wallpaper"
    echo "$random_wallpaper"
  fi
}

# List wallpapers for EWW
list_wallpapers() {
  find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | sort
}

case "$1" in
  "set")
    set_wallpaper "$2"
    ;;
  "random")
    random_wallpaper
    ;;
  "list")
    list_wallpapers
    ;;
  "current")
    get_current_wallpaper
    ;;
  *)
    echo "Usage: $0 {set|random|list|current}"
    exit 1
    ;;
esac
