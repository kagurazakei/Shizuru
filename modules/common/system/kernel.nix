{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.system.kernel;
in {
  options.system.kernel = {
    enable = mkEnableOption "Enable custom kernel configuration";
  };

  config = mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_cachyos;
      consoleLogLevel = 0;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=0"
        "rd.udev.log_level=0"
        "rd.systemd.show_status=false"
        "udev.log_priority=0"
        "systemd.mask=systemd-vconsole-setup.service"
        "systemd.mask=dev-tpmrm0.device"
        "nowatchdog"
        "modprobe.blacklist=iTCO_wdt"
        "nohibernate"
      ];

      kernelModules = [
        "v4l2loopback"
        "kvm-intel"
        "drm"
        "i2c-dev"
      ];

      extraModulePackages = [
        config.boot.kernelPackages.v4l2loopback
      ];

      initrd = {
        verbose = false;
        availableKernelModules = [
          "xhci_pci"
          "ahci"
          "nvme"
          "usb_storage"
          "usbhid"
          "sd_mod"
        ];

        kernelModules = []; # GPU kernel modules removed here
      };
    };
  };
}
