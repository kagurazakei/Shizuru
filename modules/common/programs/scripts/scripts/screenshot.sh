#!/usr/bin/env bash
# /* ---- 💫 Enhanced Screenshot Script 💫 ---- */

# Configuration
iDIR="$HOME/.config/swaync/icons"
sDIR="$HOME/.config/hypr/scripts"
notify_cmd_shot="notify-send -h string:x-canonical-private-synchronous:shot-notify -u low -i ${iDIR}/picture.png"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
DIR="${SCREENSHOT_DIR:-$HOME/Pictures/Screenshots}"
mkdir -p "$DIR"

# Sound effects
play_sound() {
    if [[ -f "${sDIR}/Sounds.sh" ]]; then
        "${sDIR}/Sounds.sh" --"$1"
    fi
}

# Notification functions
notify_view() {
    case $1 in
        active)
            if [[ -e "$active_window_path" ]]; then
                ${notify_cmd_shot} "Screenshot of '${active_window_class}' Saved." -i "$active_window_path"
                play_sound screenshot
            else
                ${notify_cmd_shot} "Screenshot of '${active_window_class}' not Saved"
                play_sound error
            fi
            ;;
        swappy)
            ${notify_cmd_shot} "Screenshot Captured."
            ;;
        *)
            if [[ -e "$output_file" ]]; then
                ${notify_cmd_shot} "Screenshot Saved." -i "$output_file"
                play_sound screenshot
            else
                ${notify_cmd_shot} "Screenshot NOT Saved."
                play_sound error
            fi
            ;;
    esac
}

# Countdown timer
countdown() {
    for sec in $(seq "$1" -1 1); do
        notify-send -h string:x-canonical-private-synchronous:shot-notify -t 1000 -i "$iDIR/timer.png" "Taking shot in: $sec"
        sleep 1
    done
}

# Screenshot functions
fullscreen() {
    output_file="$DIR/Screenshot_${DATE}.png"
    grim - | tee "$output_file" | wl-copy
    wl-paste | cliphist store
    notify_view
}

area() {
    countdown "$2"
    output_file="$DIR/Screenshot_${DATE}_Area.png"
    grim -g "$(slurp)" - | tee "$output_file" | wl-copy
    wl-paste | cliphist store
    notify_view
}

window() {
    active_window_class=$(hyprctl -j activewindow | jq -r '.class')
    output_file="$DIR/Screenshot_${DATE}_${active_window_class}.png"
    grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | tee "$output_file" | wl-copy
    wl-paste | cliphist store
    notify_view active
}

swappy_edit() {
    tmpfile=$(mktemp)
    if grim -g "$(slurp)" - > "$tmpfile"; then
        wl-copy < "$tmpfile"
        wl-paste | cliphist store
        play_sound screenshot
        notify_view swappy
        swappy -f - < "$tmpfile"
    fi
    rm "$tmpfile"
}

delayed_capture() {
    countdown "$1"
    output_file="$DIR/Screenshot_${DATE}_${1}sec.png"
    grim - | tee "$output_file" | wl-copy
    wl-paste | cliphist store
    notify_view
}

# Main execution
case $1 in
    full|--now)       fullscreen ;;
    area|--area)      area ;;
    win|window|--win|--active) window ;;
    swappy|--swappy)  swappy_edit ;;
    [0-9]*s)         delayed_capture "${1%s}" ;;
    5|--in5)         delayed_capture 5 ;;
    10|--in10)       delayed_capture 10 ;;
    *) echo -e "Available Options:
  full/--now      Fullscreen screenshot
  area/--area     Area selection screenshot
  win/--win       Active window screenshot
  swappy/--swappy Edit screenshot with swappy
  5s/--in5        Screenshot after 5 seconds
  10s/--in10      Screenshot after 10 seconds"
       exit 1 ;;
esac

exit 0
