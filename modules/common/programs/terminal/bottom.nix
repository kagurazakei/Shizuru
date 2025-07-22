{...}: {
  hj.rum.programs.bottom = {
    enable = true;
    settings = {
      styles = {
        battery = {
          high_battery_color = "#69ff94";
          low_battery_color = "#ff5555";
          medium_battery_color = "#f1fa8c";
        };

        cpu = {
          all_entry_color = "#f8f8f2";
          avg_entry_color = "#eba0ac";
          cpu_core_colors = [
            "#ff6e6e"
            "#fab387"
            "#f1fa8c"
            "#69ff94"
            "#bd93f9"
            "#ff79c6"
          ];
        };

        graphs = {
          graph_color = "#a6adc8";
          legend_text.color = "#a6adc8";
        };

        memory = {
          arc_color = "#89dceb";
          cache_color = "#f38ba8";
          gpu_colors = [
            "#74c7ec"
            "#cba6f7"
            "#ff5555"
            "#f1fa8c"
            "#f9e2af"
            "#50fa7b"
          ];
          ram_color = "#50fa7b";
          swap_color = "#ffffa5";
        };

        network = {
          rx_color = "#50fa7b";
          rx_total_color = "#8be9fd";
          tx_color = "#f38ba8";
          tx_total_color = "#50fa7b";
        };

        tables.headers.color = "#f5e0dc";

        widgets = {
          border_color = "#585b70";
          selected_border_color = "#f5c2e7";

          disabled_text.color = "#1e1e2e";

          selected_text = {
            bg_color = "#cba6f7";
            color = "#11111b";
          };

          text.color = "#cdd6f4";

          widget_title.color = "#f2cdcd";
        };
      };
    };
  };
}
