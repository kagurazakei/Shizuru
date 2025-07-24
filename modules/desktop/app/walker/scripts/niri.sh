#!/usr/bin/env bash
# 💫 Quick Edit/View of Flake Config Files – walker exec-style

edit=${EDITOR:-nano}
tty=wezterm

# Paths
configs="$HOME/shizuru/modules"
flake="$HOME/shizuru"

# Entries (label | file path)
entries=(
  "niri binding|$configs/desktop/niri/binds.nix"
  "niri default|$configs/desktop/niri/default.nix"
  "niri setting|$configs/niri/desktop/settings.nix"
  "niri window rule|$configs/desktop/niri/rules.nix"
  "flake file|$flake/flake.nix"
)

# Generate menu for walker
for entry in "${entries[@]}"; do
  label=${entry%%|*}
  file=${entry##*|}
  exec_cmd="$tty -e $edit \"$file\""
  printf "label=%s;exec=%s;\n" "$label" "$exec_cmd"
done
