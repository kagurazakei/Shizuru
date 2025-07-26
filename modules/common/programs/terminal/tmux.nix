{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 0;
    terminal = "screen-256color";
    historyLimit = 1000000;
    aggressiveResize = true;

    extraConfigBeforePlugins = ''
      set-option -g default-terminal "screen-256color"
      set-option -g terminal-overrides ",xterm-256color:RGB"
      set -g status-position top
      set -g detach-on-destroy off
      set -g set-clipboard on
      set -g pane-active-border-style "fg=magenta,bg=default"
      set -g pane-border-style "fg=brightblack,bg=default"
      set -g renumber-windows on
      set -g prefix M-n
      unbind C-b
      bind n send-prefix

      # Copy mode, vim-like behavior
      bind v copy-mode
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
      bind p paste-buffer
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "wl-copy"

      # Splits
      bind | split-window -hc "#{pane_current_path}"
      bind \\ split-window -fh -c "#{pane_current_path}"
      bind - split-window -vc "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind C command-prompt -p "Enter window name:" "new-window -n '%%'"

      # Navigation
      bind-key l next-window
      bind-key h previous-window
      bind-key -n M-l next-window
      bind-key -n M-h previous-window
      bind j switch-client -n
      bind k switch-client -p
      bind-key r command-prompt -I "#W" "rename-window '%%'"
      bind-key R command-prompt -I "#W" "rename-session '%%'"

      # Killing
      bind-key Q kill-window
      bind-key q kill-pane
      bind-key M-q kill-session

      # Swapping
      bind -r "<" swap-window -d -t -1
      bind -r ">" swap-window -d -t +1

      # Smart pane movement
      bind -n C-h if -F "#{@pane-is-vim}" "send-keys C-h" "select-pane -L"
      bind -n C-j if -F "#{@pane-is-vim}" "send-keys C-j" "select-pane -D"
      bind -n C-k if -F "#{@pane-is-vim}" "send-keys C-k" "select-pane -U"
      bind -n C-l if -F "#{@pane-is-vim}" "send-keys C-l" "select-pane -R"

      # Smart pane resizing
      bind -n C-left  if -F "#{@pane-is-vim}" "send-keys C-left"  "resize-pane -L 3"
      bind -n C-down  if -F "#{@pane-is-vim}" "send-keys C-down"  "resize-pane -D 3"
      bind -n C-up    if -F "#{@pane-is-vim}" "send-keys C-up"    "resize-pane -U 3"
      bind -n C-right if -F "#{@pane-is-vim}" "send-keys C-right" "resize-pane -R 3"

      # Compatibility fix
      if-shell -b '[ "$(tmux -V | cut -d" " -f2 | cut -d"." -f1)" -lt 3 ]' \
        "bind-key -n 'C-\\' if -F \"#{@pane-is-vim}\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(tmux -V | cut -d" " -f2 | cut -d"." -f1)" -ge 3 ]' \
        "bind-key -n 'C-\\' if -F \"#{@pane-is-vim}\" 'send-keys C-\\\\'  'select-pane -l'"

      # Copy-mode pane nav
      bind-key -T copy-mode-vi C-h select-pane -L
      bind-key -T copy-mode-vi C-j select-pane -D
      bind-key -T copy-mode-vi C-k select-pane -U
      bind-key -T copy-mode-vi C-l select-pane -R
      bind-key -T copy-mode-vi C-\\ select-pane -l

      set -g @scroll-without-changing-pane on
      set -g @emulate-scroll-for-no-mouse-alternate-buffer on
      set -g @scroll-in-copy-mode on
    '';

    extraConfig = ''
      bind C-r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded"

      bind-key Enter popup -E -h 80% -w 80% "dev"

      set -g @tmux_window_dir_programs "['nvim', 'vim', 'vi', 'git']"
      set -g @tmux_window_name_shells "['bash', 'fish', 'sh', 'zsh']"
      set -g @tmux_window_name_ignored_programs "['sqlite3']"
      set -g @tmux_window_name_max_name_len "20"
      set -g @tmux_window_name_use_tilde "False"
      set -g @tmux_window_name_show_program_args "True"

      set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
      set -g @fzf-url-history-limit '2000'

      set -g @floax-width '80%'
      set -g @floax-height '80%'
      set -g @floax-border-color 'magenta'
      set -g @floax-text-color 'blue'
      set -g @floax-bind 'p'
      set -g @floax-change-path 'true'

      set -g @sessionx-bind-zo-new-window 'ctrl-y'
      set -g @sessionx-auto-accept 'off'
      set -g @sessionx-custom-paths '/Users/antonio/NixOS-Hyprland'
      set -g @sessionx-x-path '~/NixOS-Hyprland/'
      set -g @sessionx-window-height '85%'
      set -g @sessionx-window-width '75%'
      set -g @sessionx-zoxide-mode 'on'
      set -g @sessionx-custom-paths-subdirectories 'false'
      set -g @sessionx-filter-current 'false'

      set -g @continuum-restore 'on'
      set -g @resurrect-strategy-nvim 'session'

      set -g @catppuccin_window_left_separator "█"
      set -g @catppuccin_window_right_separator "█"
      set -g @catppuccin_window_middle_separator " | "
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_default_fill "none"
      set -g @catppuccin_window_default_text "#W"
      set -g @catppuccin_window_current_fill "all"
      set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
      set -g @catppuccin_status_modules_right "application session user host date_time"
      set -g @catppuccin_status_left_separator "█"
      set -g @catppuccin_status_right_separator "█ "
      set -g @catppuccin_status_right_separator_inverse "no"
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"
      set -g @catppuccin_directory_text "#{b:pane_current_path}"
      set -g @catppuccin_meetings_text "#($HOME/.config/tmux/scripts/cal.sh)"
      set -g @catppuccin_date_time_text "%H:%M"
      set -g @catppuccin_status_modules_left "session"
    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
      tmux-thumbs
      tmux-fzf
      fzf-tmux-url
      tmux-sessionx
      tmux-floax
      (pkgs.stdenv.mkDerivation {
        name = "tmux-window-name";
        src = pkgs.fetchFromGitHub {
          owner = "ofirgall";
          repo = "tmux-window-name";
          rev = "9a75967ced4f3925de0714e96395223aa7e2b4ad";
          sha256 = "klS3MoGQnEiUa9RldKGn7D9yxw/9OXbfww43Wi1lV/w=";
        };
        buildPhase = "true"; # no build needed
        installPhase = ''
          mkdir -p $out/share/tmux/plugins/tmux-window-name
          cp -r $src/* $out/share/tmux/plugins/tmux-window-name/
        '';
      })

      (pkgs.stdenv.mkDerivation {
        name = "catppuccin-tmux";
        src = pkgs.fetchFromGitHub {
          owner = "89iuv";
          repo = "tmux";
          rev = "e7b50832f9bc59b0b5ef5316ba2cd6f61e4e22fc";
          sha256 = "9ZfUqEKEexSh06QyR5C+tYd4tNfBi3PsA+STzUv4+/s=";
        };
        buildPhase = "true"; # no build needed
        installPhase = ''
          mkdir -p $out/share/tmux/plugins/catppuccin-tmux
          cp -r $src/* $out/share/tmux/plugins/catppuccin-tmux/
        '';
      })
    ];
  };
}
