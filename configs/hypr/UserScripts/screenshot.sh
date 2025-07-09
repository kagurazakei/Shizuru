#!/usr/bin/env bash

DATE=$(date +%Y-%m-%d_%H-%M-%S)
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

# Detect compositor
COMPOSITOR=$(ps -e | grep -E 'hyprland|niri' | awk '{print $4}')

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

# Active window (Hyprland)
hyprland_window() {
    grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | wl-copy
    grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" "$DIR/$DATE.png"
    notify-send "Screenshot" "Window saved and copied to clipboard" -i "$DIR/$DATE.png"
}

# Active window (Niri)
niri_window() {
    if ! niri msg focused-window &>/dev/null; then
        notify-send "Screenshot" "No focused window found"
        exit 1
    fi
    geometry=$(niri msg focused-window | jq -r '"\(.geometry.x),\(.geometry.y) \(.geometry.width)x\(.geometry.height)"')
    grim -g "$geometry" - | wl-copy
    grim -g "$geometry" "$DIR/$DATE.png"
    notify-send "Screenshot" "Window saved and copied to clipboard" -i "$DIR/$DATE.png"
}

case $1 in
    full) fullscreen ;;
    area) area ;;
    window)
        case $COMPOSITOR in
            hyprland) hyprland_window ;;
            niri) niri_window ;;
            *) echo "Unsupported compositor"; exit 1 ;;
        esac
        ;;
    *) echo "Usage: $0 {full|area|window}"; exit 1 ;;
esac

# Add to cliphist
wl-paste | cliphist store
