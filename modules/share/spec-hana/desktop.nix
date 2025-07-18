{ ...
}: {
  imports = [
    ./bootloader.nix
    ./plymouth.nix
    ./kernel.nix
    ./nh.nix
    ./audio.nix
    ./fonts.nix
    ./locale.nix
    ./hardwareconf.nix
    ./stylix.nix
    ./system.nix
    ./services.nix
    ./flatpak.nix
    ./fonts.nix
    ./greetd.nix
    ./wayland-desktop.nix
    ./network.nix
    ./scheduler.nix
    ./virtualization.nix
    ./powermanagement.nix
    ./amd-drivers.nix
    ./intel-drivers.nix
    ./nvidia-drivers.nix
    ./nvidia-prime-drivers.nix
    ./vm-guest-services.nix
    ./local-hardware-clock.nix
    ./cachix.nix
    ./desktop-packages.nix
    ./nix.nix
    ./btrfs.nix
    ./zfs.nix
    ./zram.nix
  ];
}
