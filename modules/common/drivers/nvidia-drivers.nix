{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.drivers.nvidia;

  nvidiaPackage = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = "575.64.05";
    sha256_64bit = "sha256-hfK1D5EiYcGRegss9+H5dDr/0Aj9wPIJ9NVWP3dNUC0=";
    openSha256 = "sha256-mcbMVEyRxNyRrohgwWNylu45vIqF+flKHnmt47R//KU=";
    sha256_aarch64 = lib.fakeSha256;
    persistencedSha256 = "sha256-2g5z7Pu8u2EiAh5givP5Q1Y4zk4Cbb06W37rf768NFU=";
    settingsSha256 = "sha256-o2zUnYFUQjHOcCrB0w/4L6xI1hVUXLAWgG2Y26BowBE=";
  };
in
  with lib; {
    options.drivers.nvidia.enable = mkEnableOption "Enable NVIDIA Drivers";

    config = mkIf cfg.enable {
      boot = {
        kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];

        kernelParams = [
          "nvidia-drm.modeset=1"
          "nvidia-drm.fbdev=1"
        ];
      };

      hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          vaapiVdpau
          libvdpau
          libvdpau-va-gl
          nvidia-vaapi-driver
          vdpauinfo
          libva
          libva-utils
        ];
      };

      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        nvidiaPersistenced = false;
        open = false;
        nvidiaSettings = true;
        package = nvidiaPackage;
      };
    };
  }
