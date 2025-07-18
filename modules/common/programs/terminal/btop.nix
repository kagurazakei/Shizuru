{ ...
}: {
  hm.programs.btop = {
    enable = true;
    settings = {
      color_theme = "mocha-refine";
      theme_background = false;
    };
    themes = {
      mocha-refine = ''

        theme[main_bg]="#11121d"
        theme[main_fg]="#cdd6f4"
        theme[title]="#cdd6f4"
        theme[hi_fg]="#89b4fa"
        theme[selected_bg]="#45475a"
        theme[selected_fg]="#89b4fa"
        theme[inactive_fg]="#7f849c"
        theme[graph_text]="#f5e0dc"
        theme[meter_bg]="#45475a"
        theme[proc_misc]="#f5e0dc"
        theme[cpu_box]="#cba6f7" #Mauve
        theme[mem_box]="#a6e3a1" #Green
        theme[net_box]="#eba0ac" #Maroon
        theme[proc_box]="#89b4fa" #Blue
        theme[div_line]="#6c7086"
        theme[temp_start]="#a6e3a1"
        theme[temp_mid]="#f9e2af"
        theme[temp_end]="#f38ba8"
        theme[cpu_start]="#94e2d5"
        theme[cpu_mid]="#74c7ec"
        theme[cpu_end]="#b4befe"
        theme[free_start]="#cba6f7"
        theme[free_mid]="#b4befe"
        theme[free_end]="#89b4fa"
        theme[cached_start]="#74c7ec"
        theme[cached_mid]="#89b4fa"
        theme[cached_end]="#b4befe"
        theme[available_start]="#fab387"
        theme[available_mid]="#eba0ac"
        theme[available_end]="#f38ba8"
        theme[used_start]="#a6e3a1"
        theme[used_mid]="#94e2d5"
        theme[used_end]="#89dceb"
        theme[download_start]="#fab387"
        theme[download_mid]="#eba0ac"
        theme[download_end]="#f38ba8"
        theme[upload_start]="#a6e3a1"
        theme[upload_mid]="#94e2d5"
        theme[upload_end]="#89dceb"
        theme[process_start]="#74c7ec"
        theme[process_mid]="#b4befe"
        theme[process_end]="#cba6f7"
      '';
    };
  };
}
