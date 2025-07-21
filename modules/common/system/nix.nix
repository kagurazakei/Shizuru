{
  pkgs,
  inputs,
  lib,
  ...
}: {
  nixpkgs.overlays = lib.mkAfter [
    (final: prev: {
      lix = prev.lix.overrideAttrs (_: {
        separateDebugInfo = false;
      });
    })
  ];

  nix = {
    package = pkgs.master.lixPackageSets.git.lix;
    channel.enable = false;
    settings = {
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
