{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./bind.nix
    ./exec.nix
    ./env.nix
    ./settings.nix
    ./plugins.nix
    ./rules.nix
    ./hyprland.nix
    ./hyprpanel.nix
  ];
  hj.rum.desktops.hyprland = {
    enable = true;
    extraConfig = ''
      $UserConfigs = $HOME/.config/hypr/UserConfigs
      source = $HOME/.config/hypr/UserConfigs/application-style.conf
      source = $HOME/.config/hypr/UserConfigs/caelestia.conf
      source = $HOME/.config/hypr/UserConfigs/env.conf
      source = $HOME/.config/hypr/UserConfigs/keybindings.conf
      source = $HOME/.config/hypr/UserConfigs/settings.conf
      source = $HOME/.config/hypr/UserConfigs/Startup_Apps.conf
    '';
  };
}
