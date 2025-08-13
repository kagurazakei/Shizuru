{
  inputs,
  pkgs,
  ...
}: let
  wallpaperScript = pkgs.writeScriptBin "niri-wallpaper" (builtins.readFile ./wallpaperAutoChange.sh);
  swww = inputs.swww.packages.${pkgs.system}.swww;
in {
  imports = [
    ./bind.nix
    ./settings.nix
  ];
  hm = {
    imports = [
      inputs.niri.homeModules.niri
    ];

    xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
      pkgs.gnome-keyring
    ];
    services.arrpc.enable = true;
    services.swww = {
      enable = true;
      package = swww;
    };
    home = {
      packages = with pkgs; [
        wallpaperScript
        gnome-keyring
        wl-clipboard
        seatd
        jaq
        eww
        brillo
        cage
        qt6.qtwayland
        wl-clip-persist
        cliphist
        xwayland-satellite
        wl-clipboard
        gnome-control-center
        catppuccin-cursors.mochaGreen
      ];
      sessionVariables = {
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_STYLE_OVERRIDE = "kvantum";
        XDG_SESSION_TYPE = "wayland";
      };
    };

    systemd.user.services.polkit-gnome = {
      Unit = {
        Description = "GNOME Polkit Agent";
        After = ["graphical-session.target"];
      };
      Service = {
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };
  };
}
