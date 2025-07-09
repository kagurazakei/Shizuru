#!/usr/bin/env bash

AUR_HELPER="paru"

# Check for official updates
ofc=$(CHECKUPDATES_DB=$(mktemp -u) checkupdates | wc -l)
# Check for AUR updates
aur=$(${AUR_HELPER} -Qua | grep -v '\[ignored\]' | wc -l)
# Check for flatpak updates
if command -v flatpak >/dev/null 2>&1; then
  fpk=$(flatpak remote-ls --updates | wc -l)
  fpk_disp="\n󰏓 Flatpak $fpk"
else
  fpk=0
  fpk_disp=""
fi

total=$((ofc + aur + fpk))

case "$1" in
  text)
    if [ $total -ne 0 ]; then
      echo "$total"
    fi
    exit
    ;;
  img)
    if [ $total -ne 0 ]; then
      echo "󰮯"
    fi
    exit
    ;;
esac

if [[ "$1" != "up" ]]; then
  exit
fi

if (( ofc + aur + fpk == 0 )); then
  exit
fi

trap 'pkill -SIGUSR2 waybar' EXIT

command=$(cat <<EOF
fastfetch
printf '[Official] %-10s\n[AUR]      %-10s\n[Flatpak]  %-10s\n' "$ofc" "$aur" "$fpk"
# Synchronize databases and upgrade
# Official repos:
sudo pacman -Syu
# AUR:
$AUR_HELPER -Syu
# Flatpak:
if command -v flatpak >/dev/null 2>&1; then
  flatpak update --noninteractive
fi
read -n 1 -p 'Press any key to continue...'
EOF
)
kitty --title "System Update" -e bash -c "${command}"
