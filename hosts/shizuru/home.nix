{
  config,
  pkgs,
  pkgs-master,
  inputs,
  options,
  lib,
  system,
  ...
}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ../../modules/home-manager
  ];

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.bottom = {
    enable = true;
  };
  programs.zellij = {
    enable = true;
  };
  programs.gh = {
    enable = true;
    package = pkgs.gh;
  };
  programs.imv = {
    enable = true;
  };
  programs.htop = {
    enable = true;
  };

  catppuccin.enable = true;
  catppuccin.btop.enable = false;
  catppuccin.mako.enable = false;
  services.mako.enable = false;
  services.arrpc = {
    enable = true;
    systemdTarget = "graphical-session.target";
  };

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    VISUAL = "codium";
    BROWSER = "firefox";
  };

  programs.home-manager.enable = true;
}
