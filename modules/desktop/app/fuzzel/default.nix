{
  pkgs,
  inputs,
  ...
}: {
  hj.rum.programs.fuzzel = {
    enable = true;
    package = inputs.nyxexprs.packages.${pkgs.system}.fuzzel-git;
  };
  hj.files = {
    ".config/fuzzel/fuzzel.ini".source = "${./fuzzel.ini}";
  };
}
