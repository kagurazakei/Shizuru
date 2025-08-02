{...}: {
  imports = [
    ./qtct.nix
  ];
  hj.files = {
    ".config/qt5ct/colors/Catppuccin-Latte.conf".source = ./qt5-color/Catppuccin-Latte.conf;
    ".config/qt5ct/colors/Catppuccin-Mocha.conf".source = ./qt5-color/Catppuccin-Mocha.conf;
    ".config/qt6ct/colors/Catppuccin-Latte.conf".source = ./qt6-color/Catppuccin-Latte.conf;
    ".config/qt6ct/colors/Catppuccin-Mocha.conf".source = ./qt6-color/Catppuccin-Mocha.conf;
  };
}
