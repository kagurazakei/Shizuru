{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.private-key.nixosModules.default
    ./ssh.nix
  ];
  environment.systemPackages = with pkgs; [
    sops
    age
  ];
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
  };

  sops.secrets = {
    "nix-access-token" = {
      sopsFile = ../../../secrets/secrets.yaml;
      path = "/etc/nix/access-token.conf";
      owner = "antonio";
      mode = "0400";
    };
    "recovery-key" = {
      sopsFile = ../../../secrets/secrets.yaml;
      path = "/home/antonio/.config/git/access.txt";
      owner = "antonio";
      mode = "0400";
    };

    "age-private" = {
      sopsFile = ../../../secrets/secrets.yaml;
      path = "/home/antonio/.config/keys/agenix.txt";
      owner = "antonio";
      mode = "0400";
    };
    "gpg-key" = {
      sopsFile = ../../../secrets/secrets.yaml;
      path = "/home/antonio/.config/keys/gpg-key.txt";
      owner = "antonio";
      mode = "0400";
    };
    "github-ssh" = {
      sopsFile = ../../../secrets/secrets.yaml;
      owner = "antonio";
      mode = "0400";
    };
    "codeberg-ssh" = {
      sopsFile = ../../../secrets/secrets.yaml;
      owner = "antonio";
      mode = "0400";
    };
    "gitlab-ssh" = {
      sopsFile = ../../../secrets/secrets.yaml;
      owner = "antonio";
      mode = "0400";
    };
  };

  age.identityPaths = [config.sops.secrets."age-private".path];
  age.secrets = {
    access-token = {
      file = ../../../secrets/github.age;
      path = "/etc/nix/age-token.conf";
      mode = "0400";
    };
    anilist = {
      file = ../../../secrets/anilist.age;
      path = "/home/antonio/.config/fastanime/anilist-api.txt";
      owner = "antonio";
      mode = "0400";
    };
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
