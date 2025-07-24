
#!/bin/bash
# 💫 Quick Edit/View of Hypr Configs – walker label/exec style

edit=${EDITOR:-nano}
tty="wezterm"

# Config paths
UserConfigs="$HOME/.config/hypr/UserConfigs"

# List of entries (label + corresponding file)
entries=(
  "Application-Style|$UserConfigs/application-style.conf"
  "Caelestia Keybindings|$UserConfigs/caelestia.conf"
  "User Env Variables|$Configs/env.conf"
  "hyprscroller config|$UserConfigs/hyprscroller.conf"
  "hyprscrolling config|$UserConfigs/hyprscrolling.conf"
  "User Keybindings|$UserConfigs/keybindings.conf"
  "Decorations & Animations|$UserConfigs/settings.conf"
  "Starup_App Config|$UserConfigs/Startup_Apps.conf"
  "Window Rules|$UserConfigs/windowRules.conf"
)

# Generate walker-style list
for entry in "${entries[@]}"; do
  label=${entry%%|*}
  file=${entry##*|}
  exec_cmd="$tty -e $edit \"$file\""
  printf "label=%s;exec=%s;\n" "$label" "$exec_cmd"
done


