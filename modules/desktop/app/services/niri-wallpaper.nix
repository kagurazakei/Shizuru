{
  lib,
  config,
  pkgs,
  ...
}: let
  wallpaperScript = pkgs.writeScriptBin "niri-wallpaper" ''
    #!/usr/bin/env bash

    WALLPAPER_DIR="$HOME/Pictures/wallpapers"
    DAY=$(date +%j)
    WALLPAPER=$(ls -1 "$WALLPAPER_DIR" | sed -n "$(( (DAY % $(ls -1 "$WALLPAPER_DIR" | wc -l)) + 1 ))p")

    swww img "$WALLPAPER_DIR/$WALLPAPER" \
      --transition-type wipe \
      --transition-angle 30 \
      --transition-step 90

    wallust run -c "$HOME/.config/wallust/wallust.toml" "$WALLPAPER_DIR/$WALLPAPER"
  '';
in {
  options.cfg.wayland.niri-wallpaper.enable =
    lib.mkEnableOption "daily wallpaper rotator using swww and wallust"
    // {default = true;};

  config = lib.mkIf config.cfg.wayland.niri-wallpaper.enable {
    hj.packages = [wallpaperScript];

    hm = {
      systemd.user.services.niri-wallpaper = {
        Unit = {
          Description = "Daily Wallpaper Rotation";
          After = ["graphical-session.target"];
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${wallpaperScript}/bin/niri-wallpaper";
        };
        Install = {
          WantedBy = ["default.target"];
        };
      };

      systemd.user.timers.niri-wallpaper = {
        Unit.Description = "Daily Wallpaper Rotation Timer";
        Timer = {
          OnCalendar = "*-*-* 00:01:00";
          Persistent = true;
          Unit = "niri-wallpaper.service";
        };
        Install.WantedBy = ["timers.target"];
      };
    };
  };
}
