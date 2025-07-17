{ config
, lib
, pkgs
, host
, ...
}:
with lib; let
  cfg = config.system.bootloader-grub;
in
{
  options.system.bootloader-grub = {
    enable = mkEnableOption "Enable fail-safe GRUB bootloader with ZFS support";
  };

  config = mkIf cfg.enable {
    catppuccin.grub = {
      enable = true;
      flavor = "mocha";
    };

    boot = {
      loader.efi = {
        canTouchEfiVariables = true;
      };

      loader.timeout = 3;

      loader.systemd-boot = {
        enable = false;
        consoleMode = "auto";
        configurationLimit = 8;
      };

      loader.grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        zfsSupport = true;
        memtest86.enable = true;
        extraGrubInstallArgs = [ "--bootloader-id=${host}" ];
        configurationName = "${host}";
        gfxmodeEfi = "2160x1440";

        forceInstall = true;
        copyKernels = true;
        fsIdentifier = "uuid";

        extraInstallCommands = ''
          cp -f /boot/EFI/${host}/grubx64.efi /boot/EFI/${host}/grubx64.bak
          cp -f /boot/EFI/${host}/grubx64.efi /boot/EFI/BOOT/BOOTX64.EFI

          # Create custom grub.cfg with rescue entry
          cat > /boot/grub/custom.cfg <<EOF
          menuentry "Emergency ZFS Boot (Backup)" {
            insmod zfs
            search --no-floppy --set=root --fs-uuid ${config.fileSystems."/boot".device}
            chainloader /EFI/${host}/grubx64.bak
          }
          EOF
        '';
      };

      tmp = {
        useTmpfs = false;
        tmpfsSize = "30%";
      };

      binfmt.registrations.appimage = {
        wrapInterpreterInShell = true;
        interpreter = "${pkgs.appimage-run}/bin/appimage-run";
        recognitionType = "magic";
        offset = 0;
        mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
        magicOrExtension = ''\x7fELF....AI\x02'';
      };
    };

    systemd.services.grub-maintenance = {
      description = "GRUB fail-safe maintenance";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        if ! [ -f /boot/grub/grub.cfg ]; then
          ${pkgs.grub2_efi}/bin/grub-mkconfig -o /boot/grub/grub.cfg
        fi
        if ! [ -f /boot/EFI/${host}/grubx64.efi ]; then
          ${pkgs.grub2_efi}/bin/grub-install \
            --target=x86_64-efi \
            --efi-directory=/boot \
            --bootloader-id=${host} \
            --modules="part_gpt zfs"
        fi
      '';
    };

    # Ensure custom.cfg gets included
    environment.etc."grub.d/99_custom".text = ''
      #!/bin/sh
      exec tail -n +3 $0
      source /boot/grub/custom.cfg
    '';

    # Make custom grub script executable
    system.activationScripts.makeGrubCustomExecutable = ''
      chmod +x /etc/grub.d/99_custom
    '';

    boot.loader.grub.configurationLimit = 10;
  };
}
