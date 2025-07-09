{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  hj.rum.programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        include = "/home/antonio/.config/fuzzel/rosewater.ini";
        font = "JetBrainsMono Nerd Font:size=7";
        anchor = "top-left";
        prompt = " 󰊠 : Search..";
        width = "32";
        horizontal-pad = "10";
        vertical-pad = "10";
        inner-pad = "10";
        line-height = "20";
        lines = "8";
        letter-spacing = "0.5";
        icons-enabled = "yes";
        icon-theme = "Papirus-Dark";
        image-size-ratio = "1.0";
        x-margin = "20";
        y-margin = "20";
        match-counter = "yes";
        filter-desktop = "yes";
        layer = "overlay";
      };
    };
  };
}
