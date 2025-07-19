{
  lib,
  config,
  pkgs,
  ...
}: {
  options.cfg.wayland.xwayland-satellite.enable =
    lib.mkEnableOption "xwayland-satellite"
    // {default = true;};
  config = lib.mkIf config.cfg.wayland.xwayland-satellite.enable {
    hm = {
      systemd.user.services.wayland-satalite = {
        Unit = {
          Description = "Xwayland Satalite Service";
          After = " config.wayland.systemd.target";
          PartOf = " config.wayland.systemd.target";
        };
        Install.WantedBy = ["config.wayland.systemd.target "];
        Service = {
          Type = "simple";
          ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
          Restart = "on-failure";
          Environment = [
            "WAYLAND_DISPLAY=wayland-1"
            "XDG_RUNTIME_DIR=/run/user/%U"
          ];
        };
      };
    };
  };
}
