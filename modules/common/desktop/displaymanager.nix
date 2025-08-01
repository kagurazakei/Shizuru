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
  cfg = config.system.displayManager;
  cursorPkg = inputs.kureiji-ollie-cursor.packages.${pkgs.system}.kureiji-ollie-cursor;
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "silvia";
  };
in {
  options.system.displayManager = {
    enable = mkEnableOption "Enable Display Manager Services";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      sddm-theme
      sddm-theme.test
      pkgs.lyra-cursors
      cursorPkg
      inputs.sddm-stray.packages.${pkgs.system}.default
      inputs.waifu-cursors.packages.${pkgs.system}.Reichi-Shinigami
    ];
    qt.enable = true;
    services.xserver.enable = true;
    services.displayManager.defaultSession = "hyprland-uwsm";
    services.displayManager.sddm = {
      enable = true; # Enable SDDM.
      package = pkgs.kdePackages.sddm;
      # extraPackages = with pkgs; [
      #   kdePackages.qtsvg
      #   kdePackages.qtmultimedia
      #   kdePackages.qtvirtualkeyboard
      # ];
      extraPackages = sddm-theme.propagatedBuildInputs;
      wayland.enable = true;
      theme = sddm-theme.pname;
      #theme = "sddm-theme-stray";
      settings = {
        General = {
          GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
          InputMethod = "qtvirtualkeyboard";
        };
        Theme = {
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
    };
  };
}
