{
  lib,
  config,
  pkgs,
  ...
}: {
  options.cfg.wayland.wl-clip-persist.enable =
    lib.mkEnableOption "wl-clip-persist"
    // {default = true;};
  config = lib.mkIf config.cfg.wayland.wl-clip-persist.enable {
    systemd.user.services.wl-clip-persist = {
      enable = true;
      after = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      partOf = ["graphical-session.target"];
      unitConfig = {
        ConditionEnvironment = "WAYLAND_DISPLAY"; # Only start if WAYLAND_DISPLAY env var is set
      };
      serviceConfig = {
        ExecStart = "${lib.getExe pkgs.wl-clip-persist} --clipboard regular";
        Restart = "on-abort";
      };
    };
  };
}
