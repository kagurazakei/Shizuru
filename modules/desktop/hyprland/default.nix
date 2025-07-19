{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./bind.nix
    ./hyprland.nix
    ./hyprpanel.nix
  ];
  hj.rum.desktops.hyprland = {
    enable = true;
    extraConfig = ''
      $configs = $HOME/.config/hypr/configs
      source=$configs/Settings.conf
      $UserConfigs = $HOME/.config/hypr/UserConfigs
      source= $UserConfigs/Startup_Apps.conf
      source= $UserConfigs/ENVariables.conf
      source= $UserConfigs/Monitors.conf
      source= $UserConfigs/LaptopDisplay.conf
      source= $UserConfigs/Laptops.conf
      source= $UserConfigs/WindowRules.conf
      source= $UserConfigs/UserDecorAnimations.conf
      source= $UserConfigs/UserSettings.conf
      source= $UserConfigs/WorkspaceRules.conf
      source= $HOME/.config/hypr/themes/mocha.conf
    '';
  };
  hj.rum.desktops.hyprland = {
    plugins = [
      #inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus
      inputs.hyprscroller.packages.${pkgs.system}.hyprscroller
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprscrolling
    ];
  };
  hj.rum.desktops.hyprland.settings = {
    exec-once = [
      #"hyprpanel"
      "uwsm finalize"
      "hyprctl setcursor Kureiji-Ollie-v2 34"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "systemctl --user restart cliphist"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "dbus-update-activation-environment --all"
      "swww-daemon --format xrgb"
      "arrpc"
      "uwsm app -t service walker -- --gapplication-service"
      "uwsm app -t service arrpc"
      "uwsm-app -- qs -c ii -d"
    ];
  };
}
