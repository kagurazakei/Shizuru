#!/usr/bin/env bash

# Try to get focused window (new Niri versions)
focused=$(niri msg focused-window 2>/dev/null)

if [[ -z "$focused" || "$focused" == "null" ]]; then
    # Fallback to checking all windows (old Niri versions)
    focused=$(niri msg list-windows | jq -r '.[] | select(.is_focused == true)' 2>/dev/null)
fi

if [[ -z "$focused" || "$focused" == "null" ]]; then
    # No focused window found - show Shizuru
    echo '{"text":"Shizuru","tooltip":"No active window","class":"empty"}'
else
    # Parse window info (handle both string and proper JSON outputs)
    if [[ "$focused" == "{"* ]]; then
        # Proper JSON output
        app_class=$(echo "$focused" | jq -r '.app_id // .class // ""')
        title=$(echo "$focused" | jq -r '.title // ""')
    else
        # String output fallback
        app_class="$focused"
        title=""
    fi

    # Apply your rewrite rules
    case "$app_class" in
        "brave-browser") text="Brave Browser" ;;
        "discord") text="Discord" ;;
        "kitty") text="Kitty" ;;
        "librewolf") text="LibreWolf" ;;
        "thunar") text="Thunar" ;;
        "") text="Shizuru" ;;
        *) text="${app_class}" ;;
    esac

    echo "{\"text\":\"$text\",\"tooltip\":\"$title\",\"class\":\"active\"}"
fi
