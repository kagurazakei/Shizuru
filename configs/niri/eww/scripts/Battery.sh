#!/bin/bash

# Ruta al dispositivo de la batería
BATTERY_PATH="/org/freedesktop/UPower/devices/battery_BAT0"

# Obtener toda la info de upower
INFO=$(upower -i "$BATTERY_PATH")

# Función genérica para extraer valores
get_field() {
    echo "$INFO" | grep -i "$1" | awk -F: '{print $2}' | sed 's/^ *//'
}

# Redondear porcentaje
get_percentage() {
    raw=$(get_field "percentage")
    int=$(echo "$raw" | grep -o '[0-9]*' | head -n1)
    echo "${int}%"
}

# Icono según porcentaje y estado
get_icon() {
    state=$(get_field "state")
    raw=$(get_field "percentage")
    percent=$(echo "$raw" | grep -o '[0-9]*' | head -n1)

    if [[ "$state" == "charging" ]]; then
        if (( percent <= 20 )); then
            echo "󱊤"
        elif (( percent <= 60 )); then
            echo "󱊥"
        else
            echo "󱊦"
        fi
    else
        if (( percent <= 20 )); then
            echo "󱊡"
        elif (( percent <= 60 )); then
            echo "󱊢"
        else
            echo "󱊣"
        fi
    fi
}

case "$1" in
    --voltage)
        get_field "voltage"
        ;;
    --charge-cycles)
        get_field "charge-cycles"
        ;;
    --time-to-empty)
        get_field "time to empty"
        ;;
    --percentage)
        get_percentage
        ;;
    --temperature)
        get_field "temperature"
        ;;
    --capacity)
        get_field "capacity"
        ;;
    --state)
        get_field "state"
        ;;
    --warning-level)
        get_field "warning-level"
        ;;
    --icon)
        get_icon
        ;;
    *)
        echo "Uso: $0 [--voltage | --charge-cycles | --time-to-empty | --percentage | --temperature | --capacity | --state | --warning-level | --icon]"
        ;;
esac
