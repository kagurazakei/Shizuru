
list=$(find -L "$HOME/Pictures/wallpapers/" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \))

while walls= read -r path; do
  name=$(b=${path##*/}; echo ${b%.*})

  # Clean up name for label
  name=${name//_/ }
  name=${name//-/ }
  name=${name//   / }

  # Exec command with matugen

  # Wallpaper history setup
  wall_effect_dir="/home/antonio/.config/hypr/wallpaper-effect"
  ts_cmd="ts=\$(date +\"%%Y-%%m-%%d_%%H-%%M-%%S\")"
  mkdir_cmd="mkdir -p \"$wall_effect_dir/history\""
  cp_cmd="cp '\$path' \"$wall_effect_dir/history/wallpaper_\$ts.$ext_lower\""
  ln_cmd="ln -sf \"$wall_effect_dir/history/wallpaper_\$ts.$ext_lower\" \"$wall_effect_dir/current\""
last_log="$HOME/.local/state/wallpaper/last.txt"
exec_cmd="swww img --transition-fps 144 --transition-duration 3 -t wave \"$path\" && \
cp \"$path\" \"$HOME/Pictures/wallpapers/.wallpaper\" && \
matugen image \"$path\" && \
echo \"$path\" >> \"$last_log\" && \
ln -sf \"$path\" \"$HOME/Pictures/wallpapers/.wallpaper\" \"$HOME/.config/hypr/wallpaper-effect/.current_wallpaper\" && \
/home/antonio/.local/bin/bde rl thunar"



  printf "image=%s;label=%s;exec=%s;\n" "$path" "$name" "$exec_cmd"
done <<< "$list"




