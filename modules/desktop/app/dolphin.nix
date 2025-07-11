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
        libsForQt5.ark
        libsForQt5.ffmpegthumbs
        libsForQt5.kio
        libsForQt5.poppler
        libsForQt5.qt5.qtmultimedia
      ];
    };
}
