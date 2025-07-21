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
  sops.secrets."nix-access-token" = {
    sopsFile = ../../../secrets/github.yaml;
    path = "/home/antonio/.config/nix/access-token.conf";
    owner = "antonio";
    mode = "0400";
  };

  nix.extraOptions = "!include ${config.sops.secrets."nix-access-token".path}";
}
