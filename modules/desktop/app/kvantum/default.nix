{...}: {
  hj.files = {
    ".config/Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=rose-pine-love
    '';
    ".config/Kvantum/Catppuccin-Mocha".source = ./Catppuccin-Mocha;
    ".config/Kvantum/rose-pine-love".source = ./rose-pine-love;
    ".config/Kvantum/rose-pine-iris".source = ./rose-pine-iris;
  };
}
