#!/usr/bin/env bash

DATE=$(date +%Y-%m-%d_%H-%M-%S)
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

# Full screen
fullscreen() {
    grim - | wl-copy
    grim "$DIR/$DATE.png"
    notify-send "Screenshot" "Fullscreen saved and copied to clipboard" -i "$DIR/$DATE.png"
}

# Selected area
area() {
    grim -g "$(slurp)" - | wl-copy
    grim -g "$(slurp)" "$DIR/$DATE.png"
    notify-send "Screenshot" "Area saved and copied to clipboard" -i "$DIR/$DATE.png"
}

# Active window
window() {
    grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | wl-copy
    grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" "$DIR/$DATE.png"
    notify-send "Screenshot" "Window saved and copied to clipboard" -i "$DIR/$DATE.png"
}

case $1 in
    full) fullscreen ;;
    area) area ;;
    window) window ;;
    *) echo "Usage: $0 {full|area|window}"; exit 1 ;;
esac

# Add to cliphist
wl-paste | cliphist store
