{pkgs, ...}: {
  hj = {
    packages = [pkgs.cava];
    files = {
      ".config/cava/config".text = ''
        [color]
        background='#0a0a13'
        foreground='#f8f8f2'
        gradient=1
        gradient_color_1='#8be9fd'
        gradient_color_2='#bd93f9'
        gradient_color_3='#ff79c6'
        gradient_color_4='#ffb86c'
        gradient_color_5='#50fa7b'
        gradient_color_6='#ff5555'
        gradient_color_7='#f1fa8c'
        gradient_color_8='#ff6e6e'
        [general]
        autosens=4
        bar_spacing=1.000000
        bar_width=6.000000
        bars=0
        framerate=120
        overshoot=0
        sensitivity=50

        [smoothing]
        gravity=100
        monstercat=0
        waves=0
      '';
    };
  };
}
