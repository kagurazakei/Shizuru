{
  pkgs,
  config,
  options,
  lib,
  ...
}:
with lib; let
  cfg = config.system.scheduler;
in {
  options.system.scheduler = {
    enable = mkEnableOption "Enable Scheduler Options";
  };

  config = mkIf cfg.enable {
    services.scx = {
      enable = true;
      scheduler = "scx_lavd";
      extraArgs = ["--autopower"];
    };
  };
}
