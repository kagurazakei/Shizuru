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
    extraOptions = " access-tokens = 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";
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
