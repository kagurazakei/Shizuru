{ config
, pkgs
, inputs
, ...
}:
let
  ax-shell = inputs.ax-shell-config;
  fabric-bar = pkgs.writeScriptBin "fabric-bar" (builtins.readFile ./fabric.sh);
in
{
  hm = {
    home.activation.setupAx-Shell = config.lib.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "$HOME/.config/Ax-Shell/"
      cp -r --no-preserve=all ${ax-shell}/* "$HOME/.config/Ax-Shell"
      chmod -R u+w "$HOME/.config/Ax-Shell"
    '';

    home.file.".local/share/fonts/tabler-icons.ttf" = {
      source = "${ax-shell}/assets/fonts/tabler-icons/tabler-icons.ttf";
    };

    home.packages = with pkgs; [
      #matugen
      cava
      fabric-bar
      #hyprsunset
      wlinhibit
      tesseract
      imagemagick
      nur.repos.HeyImKyu.fabric-cli
      (nur.repos.HeyImKyu.run-widget.override {
        extraPythonPackages = with python3Packages; [
          ijson
          pillow
          psutil
          requests
          setproctitle
          toml
          watchdog
          thefuzz
          numpy
          chardet
          pydbus
        ];
        extraBuildInputs = [
          nur.repos.HeyImKyu.fabric-gray
          networkmanager
          networkmanager.dev
          playerctl
        ];
      })
    ];

    wayland.windowManager.hyprland.settings.layerrule = [
      "noanim, fabric"
    ];
  };
}
