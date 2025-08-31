{
  pkgs,
  inputs,
  ...
}: {
  hj.rum.programs.fuzzel = {
    enable = true;
    package = pkgs.fuzzel;
  };
  hj.files = {
    ".config/fuzzel/fuzzel.ini".source = "${./fuzzel.ini}";
  };
}
