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
      ags_1
      brightnessctl # for brightness control
      libinput
      python313Packages.pywayland
      neovide
      starship
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
      kitty
      nwg-look # requires unstable channel
      nwg-dock-hyprland
      master.pamixer
      master.gitui
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
      wlogout
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
      master.komikku
      master.mangayomi
      mangal
      mangareader
      master.tmux
      neofetch
      gtk4
      vivid
      inputs.shizuruPkgs.packages.${pkgs.system}.nitch
      inputs.shizuruPkgs.packages.${pkgs.system}.idle-inhibit
      inputs.shizuruPkgs.packages.${pkgs.system}.rxfetch
      nurl
      master.yazi
      #firefox_nightly
      inputs.hyprsunset.packages.${pkgs.system}.hyprsunset
      master.microfetch
      socat
      hyprpicker
      inputs.nyxexprs.packages.${pkgs.system}.ani-cli-git
    ];
  };
}
