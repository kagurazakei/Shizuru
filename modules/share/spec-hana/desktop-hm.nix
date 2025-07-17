{ ...
}: {
  imports = [
    ./home.nix
    ./git.nix
    ./fhsenv.nix
    ./nvchad.nix
    ./textfox.nix
    ./hyprland-desktop.nix
    ./desktop-packages.nix
    ./hyprpanel-desktop.nix
    ./variables.nix
    ./scripts/scripts.nix
  ];
}
