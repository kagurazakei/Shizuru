{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkIf
    mkPackageOption
    mkOption
    types
    ;

  cfg = config.mine.cliphist;
in {
  options.mine.cliphist = {
    enable = mkEnableOption "cliphist service";

    package = mkPackageOption pkgs "cliphist" {};

    allowImages = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Store images in clipboard history.
      '';
    };

    extraOptions = mkOption {
      type = with types; listOf str;
      default = [
        "-max-dedupe-search"
        "10"
        "-max-items"
        "500"
      ];
      description = ''
        Flags to append to the cliphist command.
      '';
    };

    systemdTargets = mkOption {
      type = with types; either (listOf str) str;
      default = ["graphical-session.target"];
      example = "graphical-session.target";
      description = ''
        The systemd targets that will automatically start the cliphist service.

        When setting this value to `["sway-session.target"]`,
        make sure to also enable {option}`wayland.windowManager.sway.systemd.enable`,
        otherwise the service may never be started.

        Note: A single string value is deprecated, please use a list.
      '';
    };
  };

  config = mkIf cfg.enable {
    hj.packages = [cfg.package];
  };
}
