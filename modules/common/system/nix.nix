{
  pkgs,
  inputs,
  system,
  config,
  lib,
  options,
  username,
  host,
  inputs',
  ...
}: {
  nix = {
    package = pkgs.master. nixVersions.git;
    channel.enable = false;
    settings = {
      # separateDebugInfo = true;
      nix-path = [
        "nixpkgs=${inputs.nixpkgs.outPath}"
        "nixpkgs-master=${inputs.nixpkgs-master.outPath}"
        "nixpkgs-stable=${inputs.nixpkgs-stable.outPath}"
      ];
      allowed-users = ["root" "@wheel" "antonio"];
      trusted-users = ["root" "@wheel" "antonio" "@builders"];
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
