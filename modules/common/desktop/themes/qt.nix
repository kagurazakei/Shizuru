{
  pkgs,
  lib,
  ...
}: let
  envVars = {
    QT_STYLE_OVERRIDE = "kvantum";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    ZDOTDIR = "$HOME/.config/zsh";
    PATH = "$HOME/.local/bin:$PATH";
  };
in {
  qt.enable = true;
  environment.variables = envVars;
  environment.systemPackages = with pkgs; [qt6.qtdeclarative qt6.qtmultimedia];
  nixpkgs.overlays = [
    (final: prev: {
      qt6Packages = prev.qt6Packages.overrideScope (qfinal: qprev: {
        qt6ct = qprev.qt6ct.overrideAttrs (ctprev: {
          src = pkgs.fetchFromGitHub {
            owner = "ilya-fedin";
            repo = "qt6ct";
            rev = "26b539af69cf997c6878d41ba75ad7060b20e56e";
            hash = "sha256-ePY+BEpEcAq11+pUMjQ4XG358x3bXFQWwI1UAi+KmLo=";
          };

          nativeBuildInputs = (builtins.filter (p: p != qfinal.qmake) ctprev.nativeBuildInputs) ++ [final.cmake];

          buildInputs =
            ctprev.buildInputs
            ++ (with final.kdePackages; [
              kconfig
              kcolorscheme
              kiconthemes
            ])
            ++ [final.libsForQt5.qtstyleplugins];

          cmakeFlags = [
            (lib.cmakeFeature "PLUGINDIR" "lib/qt-6/plugins")
          ];
        });
      });
    })
  ];

  hj = {
    packages = with pkgs; [
      (master.catppuccin-kde.override {
        flavour = ["mocha"];
        accents = ["green"];
      })
      master.darkly
      master.darkly-qt5
      master.libsForQt5.qtstyleplugin-kvantum # kvantum
      master.libsForQt5.qt5ct
      kdePackages.qqc2-desktop-style
      qt6ct
      adwaita-qt6
      qt6.qtwayland
      qt6.qtsvg
      libsForQt5.qtstyleplugin-kvantum
      qt6Packages.qtstyleplugin-kvantum
      kdePackages.kdialog
      kdePackages.qtpositioning
      kdePackages.syntax-highlighting
    ];
    environment.sessionVariables = envVars;
  };
}
