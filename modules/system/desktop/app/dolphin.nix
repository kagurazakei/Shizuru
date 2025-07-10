{
    inputs,
    pkgs,
    config,
    lib,
    ...
}:
{
    hj = {
     packages = with pkgs; [
        libsForQt5.dolphin
        libsForQt5.dolphin-plugins
        libsForQt5.kio-extras
        kdePackages.ark
      ];
    };
}
