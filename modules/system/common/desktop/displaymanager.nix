{
  pkgs,
  config,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}:
with lib; let
  cfg = config.system.displayManager;
  #sddm-stray = pkgs.callPackage ../../../../pkgs/stray-new.nix { };
  cursorPkg = inputs.kureiji-ollie-cursor.packages.${pkgs.system}.kureiji-ollie-cursor;
in {
  options.system.displayManager = {
    enable = mkEnableOption "Enable Display Manager Services";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.lyra-cursors
      cursorPkg
      inputs.hyprddm.packages.${pkgs.system}.default
      inputs.sddm-stray.packages.${pkgs.system}.default
      inputs.waifu-cursors.packages.${pkgs.system}.Reichi-Shinigami
    ];

    services.xserver.enable = true;
    services.displayManager.defaultSession = "hyprland-uwsm";
    services.displayManager.sddm = {
      enable = true; # Enable SDDM.
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
      ];
      wayland.enable = true;
      #theme = "sddm-astronaut-theme";
      theme = "sddm-theme-stray";
      settings = {
        Theme = {
          #CursorTheme = "Kureiji-Ollie-v2";
          CursorTheme = "Reichi-Shinigami";
        };
      };
    };
    programs.uwsm.enable = true;
    programs.uwsm.waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor manager by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
      niri = {
        prettyName = "Niri The Goat";
        comment = "Niri";
        binPath = "/run/current-system/sw/bin/niri-session";
      };
      maomao = {
        prettyName = "MaoMao-WM";
        comment = "maomao";
        binPath = "/run/current-system/sw/bin/maomao";
      };
    };
  };
}
