{
  inputs,
  pkgs,
  config,
  ...
}: let
  home = "/home/antonio/.config/age";
in {
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
    sopsFile = ../../../secrets/access-token.yaml;
    path = "/etc/nix/access-token.conf";
    owner = "antonio";
    mode = "0400";
  };
  sops.secrets."recovery-key" = {
    sopsFile = ../../../secrets/private.yaml;
    path = "/home/antonio/.config/git/access.txt";
    owner = "antonio";
    mode = "0400";
  };

  age.identityPaths = ["/home/antonio/.config/age/keys.txt"];
  age.secrets = {
    access-token = {
      file = ../../../secrets/github.age;
      path = "/etc/nix/age-token.conf";
      mode = "0400";
    };
  };
  age.secrets = {
    anilist = {
      file = ../../../secrets/anilist.age;
      path = "/home/antonio/.config/fastanime/anilist-api.txt";
      owner = "antonio";
      mode = "0400";
    };
  };
  age.secrets = {
    private = {
      file = ../../../secrets/private.age;
      path = "/home/antonio/.config/keys/github-sops.txt";
      owner = "antonio";
      mode = "0400";
    };
  };
  nix.extraOptions = "
  !include ${config.sops.secrets."nix-access-token".path}
  !include ${config.age.secrets."access-token".path}
  ";
}
