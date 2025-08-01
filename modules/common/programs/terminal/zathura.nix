{ pkgs
, ...
}: {
  hj = {
    packages = [ pkgs.zathura ];
    files = {
      ".config/zathura/zathurarc".text = ''
                              # Open document in fit-width mode by default
        set adjust-open "best-fit"

        # One page per row by default
        set pages-per-row 1

        # Stop at page boundaries
        set scroll-page-aware "true"
        set smooth-scroll "true"
        set scroll-full-overlap 0.01
        set scroll-step 100

        # Zoom settings
        set zoom-min 10
        set guioptions ""

        # Disable render loading
        set render-loading "false"

        # Font setting
        set font "JetBrainsMono Nerd Font"

        # Key mappings
        unmap f
        map f toggle_fullscreen
        unmap a
        map a toggle_statusbar
        map [fullscreen] f toggle_fullscreen

        # Clipboard and title settings
        set selection-clipboard clipboard
        set window-title-page true

        # Colors
        set default-fg                rgba(202,211,245,1)
        set default-bg                rgba(30,30,46,1)

        set completion-bg             rgba(30,30,46,1)
        set completion-fg             rgba(202,211,245,1)
        set completion-highlight-bg   rgba(87,82,104,1)
        set completion-highlight-fg   rgba(202,211,245,1)
        set completion-group-bg       rgba(54,58,79,1)
        set completion-group-fg       rgba(138,173,244,1)

        set statusbar-fg              rgba(202,211,245,1)
        set statusbar-bg              rgba(54,58,79,1)

        set notification-bg           rgba(54,58,79,1)
        set notification-fg           rgba(202,211,245,1)
        set notification-error-bg     rgba(54,58,79,1)
        set notification-error-fg     rgba(237,135,150,1)
        set notification-warning-bg   rgba(54,58,79,1)
        set notification-warning-fg   rgba(250,227,176,1)

        set inputbar-fg               rgba(202,211,245,1)
        set inputbar-bg               rgba(54,58,79,1)

        # Recolor settings
        set recolor                   "true"
        set recolor-lightcolor        rgba(30,30,47,1)
        set recolor-darkcolor         rgba(202,211,245,1)

        set index-fg                  rgba(202,211,245,1)
        set index-bg                  rgba(30,30,46,1)
        set index-active-fg           rgba(202,211,245,1)
        set index-active-bg           rgba(54,58,79,1)

        set render-loading-bg         rgba(30,30,46,1)
        set render-loading-fg         rgba(202,211,245,1)

        set highlight-color           rgba(87,82,104,0.5)
        set highlight-fg              rgba(245,189,230,0.5)
        set highlight-active-color    rgba(245,189,230,0.5)

        # Additional recolor settings
        set recolor-reverse-video     "true"
        set recolor-keephue           "true"


      '';
    };
  };
}
