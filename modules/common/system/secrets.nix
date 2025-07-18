{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  environment.systemPackages = with pkgs; [
    sops
    age
  ];
  sops = {
    defaultSopsFile = ../../../secrets/access-token.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/antonio/.config/sops/age/keys.txt";
  };
}
