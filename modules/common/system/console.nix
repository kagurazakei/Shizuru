{
  lib,
  config,
  pkgs,
  ...
}: {
  options.cfg.mine.console-colors.enable =
    lib.mkEnableOption "Console Color(TTY)"
    // {default = true;};
  config = lib.mkIf config.cfg.mine.console-colors.enable {
    console = {
      colors = [
        "1e1e2e"
        "f38ba8"
        "a6e3a1"
        "f9e2af"
        "89b4fa"
        "f5c2e7"
        "94e2d5"
        "bac2de"
        "585b70"
        "f38ba8"
        "a6e3a1"
        "f9e2af"
        "89b4fa"
        "f5c2e7"
        "94e2d5"
        "a6adc8"
      ];
    };
  };
}
