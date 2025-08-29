{
  pkgs,
  config,
  options,
  lib,
  inputs,
  system,
  ...
}:
with lib; let
  swww = inputs.swww.packages.${pkgs.system}.swww;
  cfg = config.system.packages;
in {
  options.system.packages = {
    enable = mkEnableOption "Enable Laptop Specific Packages";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      brightnessctl # for brightness control
      libinput
      python313Packages.pywayland
      neovide
      cliphist
      hyprpanel
      eog
      gnome-system-monitor
      file-roller
      grim
      hiddify-app
      gtk-engine-murrine # for gtk themes
      hyprcursor # requires unstable channel
      qcomicbook
      ahoviewer
      imagemagick
      inxi
      jq
      nwg-look # requires unstable channel
      nwg-dock-hyprland
      master.pamixer
      pavucontrol
      playerctl
      polkit_gnome
      pyprland
      python313Packages.kde-material-you-colors
      rofi-wayland
      slurp
      swappy
      swww
      unzip
      wallust
      wl-clipboard
      yad
      yt-dlp
      nix-ld
      power-profiles-daemon
      fd
      master.home-manager
      master.waypaper
      bluez-tools
      wgpu-utils
      gtk3
      gtk4
      atuin
      bun
      zoxide
      dart-sass
      sass
      readest
      wf-recorder
      sassc
      libgtop
      telegram-desktop
      papirus-folders
      papirus-icon-theme
      joypixels
      spotify
      bibata-cursors
      gpu-screen-recorder
      libqalculate
      dbus-glib
      gtkmm4
      komikku
      mangayomi
      mangal
      mangareader
      master.tmux
      neofetch
      gtk4
      vivid
      inputs.shizuruPkgs.packages.${pkgs.system}.nitch
      inputs.shizuruPkgs.packages.${pkgs.system}.idle-inhibit
      inputs.shizuruPkgs.packages.${pkgs.system}.rxfetch
      inputs.fastanime.packages.${pkgs.system}.default
      nurl
      inputs.hyprsunset.packages.${pkgs.system}.hyprsunset
      master.microfetch
      socat
      hyprpicker
      master.ani-cli
      inputs.zen-browser.packages.${pkgs.system}.default
      zellij
    ];
  };
}
