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
  cfg = config.system.scheduler;
in {
  options.system.scheduler = {
    enable = mkEnableOption "Enable Scheduler Options";
  };

  config = mkIf cfg.enable {
    services.scx = {
      enable = true;
      package = pkgs.scx_git.rustscheds;
      scheduler = "scx_lavd";
      extraArgs = ["--autopower"];
    };
  };
}
