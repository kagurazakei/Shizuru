{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.drivers.intel;
in
  with lib; {
    options.drivers.intel.enable = mkEnableOption "Enable Intel Graphics Drivers";

    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        vulkan-loader
        vulkan-tools
        libva-utils
      ];

      environment.variables = {
        LIBVA_DRIVER_NAME = "iHD";
        VDPAU_DRIVER = "va_gl";
      };

      boot = {
        kernelModules = ["i915"];

        kernelParams = [
          "i915.enable_guc=2" # Enable GuC + HuC firmware loading
          "i915.fastboot=1" # Faster boot times
          "i915.enable_psr=0" # Disable Panel Self Refresh (fix flicker)
        ];
      };

      nixpkgs.config.packageOverrides = pkgs: {
        vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
      };
      # chaotic.mesa-git = {
      #   enable = true;
      #   extraPackages = with pkgs; [
      #     intel-media-driver
      #     vaapiIntel
      #   ];
      # };
      hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver
          libva
          intel-vaapi-driver
          vaapiVdpau
          intel-compute-runtime
          libvdpau-va-gl
          libvdpau
          mesa
        ];
      };
    };
  }
