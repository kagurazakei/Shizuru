{ pkgs
, config
, options
, lib
, inputs
, system
, ...
}:
with lib; let
  cfg = config.system.plymouth;
in
{
  options.system.plymouth = {
    enable = mkEnableOption "Enable plymouth";
  };

  config = mkIf cfg.enable {
    boot = {
      plymouth.enable = true;
      plymouth.themePackages = [ inputs.shizuruPkgs.packages.${pkgs.system}.cat-plymouth ];
      plymouth.theme = "catppuccin-mocha-mod";
    };
  };
}
