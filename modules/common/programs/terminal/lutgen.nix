{pkgs, ...}: let
  makeWrapper = name: args:
    pkgs.writeShellScriptBin name ''
      exec ${pkgs.master.lutgen}/bin/lutgen apply ${args} --preserve -p tokyo-mod
    '';
in {
  hj = {
    packages = [
      pkgs.master.lutgen
      (makeWrapper "lutgen-jpg" "*.jpg")
      (makeWrapper "lutgen-png" "*.png")
      (makeWrapper "lutgen-all" "*.jpg *.png *.jpeg")
    ];
    files = {
      ".config/lutgen/droxo-mokyo".text = ''
        #0a0a13
        #11121d
        #181825
        #181825
        #f8f8f2
        #cdd6f4
        #e2e2df
        #ff5555
        #50fa7b
        #5af78e
        #08bdba
        #33b1ff
        #78a9ff
        #bd93f9
        #ff79c6
        #82cfff
      '';
      ".config/lutgen/tokyo-mod".text = ''
        #0a0a13
        #12121a
        #1b1b28
        #1e1e2e
        #cbccd1
        #787c99
        #d5d6db
        #a9b1d6
        #9ece6a
        #c0caf5
        #bb9af7
        #f7768e
        #2ac3de
        #0db9d7
        #b4f9f8
      '';
    };
  };
}
