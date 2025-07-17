{ pkgs
, config
, options
, lib
, system
, ...
}:
with lib; let
  cfg = config.system.bootloader-systemd;
in
{
  options.system.bootloader-systemd = {
    enable = mkEnableOption "Enable Bootloader systemd-boot";
  };

  config = mkIf cfg.enable {
    boot = {
      consoleLogLevel = 0;
      loader.efi = {
        canTouchEfiVariables = true;
      };
      loader.timeout = 0;
      loader.systemd-boot = {
        enable = true;
        consoleMode = "max";
        configurationLimit = 8;
        editor = false;
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
  };
}
