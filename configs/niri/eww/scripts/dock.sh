#!/bin/bash

FLAGS_DIR="$HOME/.config/hypr/eww/scripts"
DOCK_FLAG="$FLAGS_DIR/.dock"
LOCATION_FLAG="$FLAGS_DIR/.docklocation"
AUTOHIDE_FLAG="$FLAGS_DIR/.autohide"

# Leer contenido de flag
read_flag() {
    local file="$1"
    [[ -f "$file" ]] && cat "$file" || echo ""
}

# Escribir en flag
write_flag() {
    echo "$2" > "$1"
}

# Matar dock
kill_dock() {
    pkill -f "nwg-dock-hyprland"
    sleep 0.3
}

# Lanzar dock con configuración actual
launch_dock() {
    local location autohide args
    location=$(read_flag "$LOCATION_FLAG")
    autohide=$(read_flag "$AUTOHIDE_FLAG")

    args="-i 32 -w 5 -mb 5 -ml 5 -mr 5 -x -s style.css"
    [[ -n "$location" ]] && args="$args -p $location"
    [[ "$autohide" == "on" ]] && args="$args -d"
    args="$args -c 'rofi -show drun -theme $HOME/.config/hypr/eww/themes/rofi/Launcher.rasi'"

    echo "Lanzando dock con: nwg-dock-hyprland $args"
    eval "nwg-dock-hyprland $args &"
}

# Acción principal
case "$1" in
    --toggle)
        dock_status=$(read_flag "$DOCK_FLAG")
        if [[ "$dock_status" == "on" ]]; then
            echo "Desactivando dock..."
            write_flag "$DOCK_FLAG" "off"
            kill_dock
        else
            echo "Activando dock..."
            write_flag "$DOCK_FLAG" "on"
            kill_dock
            launch_dock
        fi
        ;;

    --location)
        new_location="$2"
        echo "Cambiando posición del dock a: $new_location"
        write_flag "$LOCATION_FLAG" "$new_location"
        if [[ "$(read_flag "$DOCK_FLAG")" == "on" ]]; then
            kill_dock
            launch_dock
        fi
        ;;

    --autohide)
        new_autohide="$2"
        echo "Actualizando autohide a: $new_autohide"
        write_flag "$AUTOHIDE_FLAG" "$new_autohide"
        if [[ "$(read_flag "$DOCK_FLAG")" == "on" ]]; then
            kill_dock
            launch_dock
        fi
        ;;

    *)
        echo "Uso:"
        echo "  $0 --toggle              # Activa o desactiva el dock"
        echo "  $0 --location left|right|top|bottom"
        echo "  $0 --autohide on|off"
        ;;
esac
