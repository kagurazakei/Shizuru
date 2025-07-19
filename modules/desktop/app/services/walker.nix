{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options.cfg.wayland.walker.enable =
    lib.mkEnableOption "walker"
    // {default = true;};
  config = lib.mkIf config.cfg.wayland.walker.enable {
    hm = {
      systemd.user.services.walker = {
        Unit = {
          Description = "Walker Application Service";
          After = ["graphical-session.target"];
        };
        Service = {
          ExecStart = "${inputs.walker.packages.${pkgs.system}.default}/bin/walker --gapplication-service";
          Restart = "on-failure";
        };
        Install = {
          WantedBy = ["graphical-session.target"];
        };
      };
    };
  };
}
