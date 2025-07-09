#!/bin/bash

# Leer el nombre del tema actual
read -r THEME < ~/.config/hypr/eww/themes/.theme

# Cargar los arrays del archivo del tema
. "$HOME/.config/hypr/eww/themes/$THEME/.hyprcolors"

# Verificar si hay argumentos
[[ -z "$1" && -z "$2" ]] && echo "Faltan argumentos: uso ./Hyprborders.sh [focused] [unfocused]" && exit 1

# Si se pasó un primer argumento (color focused), se usa
if [[ -n "$1" ]]; then
    if [[ -n "${focused_colors[$1]}" ]]; then
        focused_val="${focused_colors[$1]}"
        echo "$focused_val" > ~/.config/hypr/eww/themes/$THEME/.focused
    else
        echo "Color '${1}' no está definido en focused_colors"
        exit 1
    fi
fi

# Si se pasó un segundo argumento (color unfocused), se usa
if [[ -n "$2" ]]; then
    if [[ -n "${unfocused_colors[$2]}" ]]; then
        unfocused_val="${unfocused_colors[$2]}"
        echo "$unfocused_val" > ~/.config/hypr/eww/themes/$THEME/.unfocused
    else
        echo "Color '${2}' no está definido en unfocused_colors"
        exit 1
    fi
fi

# Leer los valores actuales (por si solo uno fue modificado)
FOCUSED=$(< ~/.config/hypr/eww/themes/$THEME/.focused)
UNFOCUSED=$(< ~/.config/hypr/eww/themes/$THEME/.unfocused)

# Usar sed para modificar directamente hyprland.conf
sed -i "s/^\$borders_focused = .*/\$borders_focused = $FOCUSED/" ~/.config/hypr/hyprland.conf
sed -i "s/^\$borders_unfocused = .*/\$borders_unfocused = $UNFOCUSED/" ~/.config/hypr/hyprland.conf
