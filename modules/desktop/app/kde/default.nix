{...}: {
  imports = [
    ./dolphin.nix
  ];
  hj.files = {
    ".config/menus/applications.menu".source = "${./applications.menu}";
  };
}
