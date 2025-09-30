{
  pkgs,
  inputs,
  username,
  host,
  lib,
  ...
}: let
  inherit (import ./variables.nix) gitUsername;
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    (lib.modules.mkAliasOptionModule ["hm"] ["home-manager" "users" "${username}"])
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
    ];
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs username host;
    };
  };
  hm = {
    imports = [
      ./home.nix
    ];
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "25.05";
  };

  users = {
    defaultUserShell = pkgs.fish;
    mutableUsers = true;
    users."${username}" = {
      shell = pkgs.fish;
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
      ];

      packages = with pkgs; [];
    };
  };

  nix.settings.allowed-users = ["${username}"];
  environment.shells = with pkgs; [fish];
  environment.systemPackages = with pkgs; [fzf];
}
