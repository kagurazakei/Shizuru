{pkgs, ...}: let
  kitty-scripts = pkgs.stdenv.mkDerivation {
    name = "kitty-scripts";
    src = ./kitty-scripts;
    installPhase = ''
      mkdir -p $out/share/kitty
      cp neighboring_window.py $out/share/kitty/
      cp pass_keys.py $out/share/kitty/
      cp relative_resize.py $out/share/kitty/
      cp scroll_mark.py $out/share/kitty/
      cp kitty-open-helper.sh $out/share/kitty/
      chmod +x $out/share/kitty/*.{py,sh}
    '';
  };
in {
  hj.rum.programs.kitty = {
    enable = true;
    settings = {
      # All your existing color and appearance settings
      foreground = "#f8f8f2";
      background = "#0a0a13";
      selection_foreground = "#0a0a13";
      selection_background = "#bd93f9";
      color0 = "#0a0a13";
      color8 = "#44475a";
      color1 = "#ff5555";
      color9 = "#ff6e6e";
      color2 = "#50fa7b";
      color10 = "#69ff94";
      color3 = "#f1fa8c";
      color11 = "#ffffa5";
      color4 = "#bd93f9";
      color12 = "#d6acff";
      color5 = "#ff79c6";
      color13 = "#ff92df";
      color6 = "#8be9fd";
      color14 = "#a4ffff";
      color7 = "#f8f8f2";
      color15 = "#ffffff";
      cursor = "#bd93f9";
      cursor_text_color = "#0a0a13";
      url_color = "#8be9fd";
      bell_border_color = "#ffb86c";
      active_tab_foreground = "#0a0a13";
      active_tab_background = "#bd93f9";
      inactive_tab_foreground = "#6272a4";
      inactive_tab_background = "#1e1e2e";

      # Font settings
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "JetBrainsMono Nerd Font Bold";
      italic_font = "JetBrainsMono Nerd Font Italic";
      bold_italic_font = "JetBrainsMono Nerd Font SemiBold Italic";
      font_size = 14;
      modify_font = "cell_height 100%";

      # Window and tab settings
      enabled_layouts = "*";
      window_resize_step_cells = 2;
      window_resize_step_lines = 2;
      window_border_width = "1pt";
      window_margin_width = 0;
      single_window_margin_width = -1;
      window_padding_width = 12;
      tab_bar_edge = "bottom";
      tab_bar_margin_width = 0.0;
      tab_bar_margin_height = "0.0 0.0";
      tab_bar_style = "powerline";
      tab_bar_align = "left";
      tab_bar_min_tabs = 2;
      tab_switch_strategy = "previous";
      tab_fade = "0.25 0.5 0.75 1";
      tab_separator = " ┇";
      tab_powerline_style = "slanted";
      tab_activity_symbol = "none";
      tab_title_template = "{f'{title[:30]}…' if title.rindex(title[-1]) + 1 > 30 else (title.center(6) if (title.rindex(title[-1]) + 1) % 2 == 0 else title.center(5))}";
      active_tab_title_template = "none";
      active_tab_font_style = "bold-italic";
      inactive_tab_font_style = "normal";
      notify_on_cmd_finish = "always";
      # Core behavior
      editor = "nvim";
      allow_remote_control = "yes";
      listen_on = "unix:@mykitty";
      allow_hyperlinks = "yes";
      shell_integration = "enabled";
      confirm_os_window_close = 0;
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.2";
      cursor_trail_start_threshold = 10;
      cursor_shape = "beam";
      cursor_beam_thickness = "1.5";
      kitty_mod = "ctrl+shift";

      # All your existing keybindings
      "map opt+cmd+page_up" = "scroll_line_up";
      "map kitty_mod+down" = "scroll_line_down";
      "map opt+cmd+page_down" = "scroll_line_down";
      "map cmd+down" = "scroll_line_down";
      "map kitty_mod+k" = "scroll_page_up";
      "map cmd+page_up" = "scroll_page_up";
      "map kitty_mod+j" = "scroll_page_down";
      "map cmd+page_down" = "scroll_page_down";
      "map kitty_mod+home" = "scroll_home";
      "map cmd+home" = "scroll_home";
      "map kitty_mod+end" = "scroll_end";
      "map cmd+end" = "scroll_end";
      "map kitty_mod+z" = "scroll_to_prompt -1";

      # Window management
      "map kitty_mod+enter" = "new_window";
      "map cmd+enter" = "new_window";
      "map ctrl+alt+enter" = "launch --cwd=current";
      "map kitty_mod+]" = "next_window";
      "map kitty_mod+[" = "previous_window";
      "map kitty_mod+f" = "move_window_forward";
      "map kitty_mod+b" = "move_window_backward";

      # Tab management
      "map kitty_mod+right" = "next_tab";
      "map shift+cmd+]" = "next_tab";
      "map ctrl+tab" = "next_tab";
      "map kitty_mod+left" = "previous_tab";
      "map shift+cmd+[" = "previous_tab";
      "map ctrl+shift+tab" = "previous_tab";
      "map kitty_mod+t" = "new_tab";
      "map cmd+t" = "new_tab";
      "map kitty_mod+q" = "close_tab";
      "map cmd+w" = "close_tab";
      "map kitty_mod+." = "move_tab_forward";
      "map kitty_mod+," = "move_tab_backward";
      "map kitty_mod+n" = "set_tab_title";

      # Layout management
      "map kitty_mod+l" = "next_layout";

      # Font sizes
      "map kitty_mod+equal" = "change_font_size all +1.0";
      "map kitty_mod+plus" = "change_font_size all +1.0";
      "map kitty_mod+kp_add" = "change_font_size all +1.0";
      "map cmd+plus" = "change_font_size all +1.0";
      "map cmd+equal" = "change_font_size all +1.0";
      "map shift+cmd+equal" = "change_font_size all +1.0";
      "map kitty_mod+minus" = "change_font_size all -1.0";
      "map kitty_mod+kp_subtract" = "change_font_size all -1.0";
      "map cmd+minus" = "change_font_size all -1.0";
      "map shift+cmd+minus" = "change_font_size all -1.0";
      "map kitty_mod+backspace" = "change_font_size all 0";
      "map cmd+0" = "change_font_size all 0";

      # Custom commands
      "map kitty_mod+e" = "launch --type=background --cwd=current sh -c 'hyprctl dispatch exec \"[float; size 60% 60%; center 1] xdg-open\" $(pwd)'";
      "map kitty_mod+u" = "launch --type=background --cwd=current sh -c 'vscodium $(pwd)'";
      "map kitty_mod+y" = "launch --type=overlay-main --cwd=current yazi";
      "map kitty_mod+f5" = "load_config_file";
      "action_alias kitty_scrollback_nvim" = "kitten ~/.local/share/nvim/lazy/kitty-scrollback.nvim/python/kitty_scrollback_nvim.py";
      "map kitty_mod+h" = "kitty_scrollback_nvim";
      "map kitty_mod+g" = "kitty_scrollback_nvim --config ksb_builtin_last_cmd_output";

      # Script aliases
      "action_alias neighboring_window" = "kitten ${kitty-scripts}/share/kitty/neighboring_window.py";
      "action_alias passkey" = "kitten ${kitty-scripts}/share/kitty/passkey.py";
      "action_alias relative_resize" = "kitten ${kitty-scripts}/share/kitty/relative_resize.py";
      "action_alias scroll_mark" = "kitten ${kitty-scripts}/share/kitty/scroll_mark.py";
      "action_alias open_helper" = "launch --type=background ${kitty-scripts}/share/kitty/kitty-open-helper.sh";

      # Open helper keybindings
      "map ctrl+o" = "open_helper @selection";
      "map cmd+o" = "open_helper @path";

      # Protocol handlers using open helper
      "protocol file" = "";
      "mime inode/directory" = "";

      # Vim-style navigation (with tmux/Vim passthrough)
      "map ctrl+h" = "passkey neighboring_window left ctrl+h nvim";
      "map ctrl+j" = "passkey neighboring_window bottom ctrl+j nvim";
      "map ctrl+k" = "passkey neighboring_window top ctrl+k nvim";
      "map ctrl+l" = "passkey neighboring_window right ctrl+l nvim";

      # Smart window resizing
      "map ctrl+shift+h" = "relative_resize relative_resize left 5 nvim";
      "map ctrl+shift+j" = "relative_resize relative_resize down 5 nvim";
      "map ctrl+shift+k" = "relative_resize relative_resize up 5 nvim";
      "map ctrl+shift+l" = "relative_resize relative_resize right 5 nvim";

      # Scroll marks
      "map ctrl+shift+m" = "scroll_mark";
      "map ctrl+shift+n" = "scroll_mark prev";
      "map ctrl+shift+o" = "set_mark";

      # Fallback navigation (non-Vim)
      "map ctrl+alt+h" = "neighboring_window left";
      "map ctrl+alt+j" = "neighboring_window bottom";
      "map ctrl+alt+k" = "neighboring_window top";
      "map ctrl+alt+l" = "neighboring_window right";
    };

    integrations = {
      fish.enable = true;
    };
  };

  # Ensure xdg-utils is available for the open helper
  hj.packages = [pkgs.xdg-utils];
}
