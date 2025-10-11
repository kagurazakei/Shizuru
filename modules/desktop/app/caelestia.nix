{
  pkgs,
  inputs,
  ...
}: {
  hj.packages = [
    inputs.caelestia.packages.${pkgs.system}.default
    inputs.caelestia-cli.packages.${pkgs.system}.caelestia-cli
  ];
}
