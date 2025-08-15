{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.meta) getExe;
  inherit (lib.filesystem) listFilesRecursive;
in {
  hj.rum.desktops.niri = {
    enable = true;
    configFile = pkgs.concatText "config.kdl" (listFilesRecursive ./configs);
    spawn-at-startup = [
      ["wl-paste" "--type" "image" "--watch" "cliphist" "store"]
      ["${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"]
      ["wl-paste" "--type" "text" "--watch" "cliphist" "store"]
      ["swww-daemon"]
      ["lysec-bar"]
      ["dbus-update-activation-environment" "--systemd" "WAYLAND_DISPLAY" "XDG_CURRENT_DESKTOP"]
      ["systemctl" "--user" "import-environment" "WAYLAND_DISPLAY" "XDG_CURRENT_DESKTOP"]
      ["dbus-update-activation-environment" "--all"]
      ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"]
      ["${pkgs.xdg-desktop-portal-gnome}/libexec/xdg-desktop-portal-gnome"]
    ];
    extraVariables = {
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      OZONE_PLATFORM = "wayland";
      JAVA_AWT_WM_NONEREPARENTING = "1";
      ELECTRON_ENABLE_HARDWARE_ACCELERATION = "1";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
      DISPLAY = ":0";
    };
  };
}
