{ config
, ...
}: {
  services.openssh.enable = true;
  nix.extraOptions = "!include ${config.sops.secrets."access-tokens".path}";
}
