{
  inputs,
  system,
}: let
  nixpkgs-master = import inputs.nixpkgs-master {
    inherit system;
    config.allowUnfree = true;
  };
in [
  inputs.niri.overlays.niri
  inputs.nur.overlays.default
  #inputs.custom-nixpkgs.overlays.default

  (final: prev: {
    stable = import inputs.nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
      config.nvidia.acceptLicense = true;
    };
    unstable = prev; # Explicit alias for nixos-unstable
    master = nixpkgs-master; # Already defined
    walker = inputs.walker.packages.${system}.default;
    quickshell = inputs.quickshell.packages.${system}.default;
    nvchad = inputs.nvchad4nix.packages.${system}.nvchad;
    zjstatus = inputs.zjstatus.packages.${system}.default;
    agsv1 = inputs.agsv1.legacyPackages.${system}.agsv1;
  })

  (final: prev: {
    linuxPackages_cachyos = prev.linuxPackages_cachyos.extend (_: prev': {
      v4l2loopback = prev'.v4l2loopback.overrideAttrs (_: rec {
        version = "0.15.0";
        src = final.fetchFromGitHub {
          owner = "umlaeute";
          repo = "v4l2loopback";
          rev = "v${version}";
          hash = "sha256-fa3f8GDoQTkPppAysrkA7kHuU5z2P2pqI8dKhuKYh04=";
        };
      });
    });

    sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
      pname = "sf-mono-liga-bin";
      version = "dev";
      src = inputs.sf-mono-liga-src;
      dontConfigure = true;
      installPhase = ''
        mkdir -p $out/share/fonts/opentype
        cp -R $src/*.otf $out/share/fonts/opentype/
      '';
    };
  })

  # Add the Qt6 overlay here
  (final: prev: {
    qt6Packages = prev.qt6Packages.overrideScope (qfinal: qprev: {
      qt6ct = qprev.qt6ct.overrideAttrs (ctprev: {
        src = prev.fetchFromGitHub {
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
          ]);

        cmakeFlags = [
          (prev.lib.cmakeFeature "PLUGINDIR" "lib/qt-6/plugins")
        ];
      });
    });
  })
]
