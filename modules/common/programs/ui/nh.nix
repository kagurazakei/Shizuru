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
}: {
  programs.nh = {
    enable = true;
    flake = "/home/antonio/shizuru/";
    clean = {
      enable = true;
      extraArgs = "--keep-since 3d --keep 3";
    };
  };
  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
  environment.variables.NH_FLAKE = "/home/antonio/shizuru/";
  environment.variables.NH_OS_FLAKE = "/home/antonio/shizuru/";
}
