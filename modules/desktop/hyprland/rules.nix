{...}: {
  hj.rum.desktops.hyprland = {
    settings = {
      "$scratchpadsize" = "size 60% 65%";
      "$scratchpad" = "class:^(scratchpad.foo)$";
      windowrule = [
        # Scratchpad rules
        "float, $scratchpad"
        "center, $scratchpad"
        # Browser tagging
        "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$"
        "tag +browser, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$"
        "tag +browser, class:^(chrome-.+-Default)$"
        "tag +browser, class:^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable))$"
        "tag +browser, class:^(Brave-browser(-beta|-dev|-unstable)?)$"
        "tag +browser, class:^([Tt]horium-browser|[Cc]achy-browser)$"
        "tag +browser, class:^(zen-alpha)$"
        # Application tagging
        "tag +terminal, class:^(Alacritty|kitty|kitty-dropterm)$"
        "tag +email, class:^([Tt]hunderbird|org.gnome.Evolution)$"
        "tag +email, class:^(eu.betterbird.Betterbird)$"
        "tag +projects, class:^(codium|codium-url-handler|VSCodium)$"
        "tag +projects, class:^(VSCode|code-url-handler)$"
        "tag +projects, class:^(jetbrains-.+)$"
        "tag +screenshare, class:^(com.obsproject.Studio)$"
        "tag +im, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$"
        "tag +im, class:^([Ff]erdium)$"
        "tag +im, class:^([Ww]hatsapp-for-linux)$"
        "tag +im, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$"
        "tag +im, class:^(teams-for-linux)$"
        "tag +games, class:^(gamescope)$"
        "tag +games, class:^(steam_app_\\d+)$"
        "tag +gamestore, class:^([Ss]team)$"
        "tag +gamestore, title:^([Ll]utris)$"
        "tag +gamestore, class:^(com.heroicgameslauncher.hgl)$"
        "tag +file-manager, class:^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$"
        "tag +file-manager, class:^(app.drey.Warp)$"
        "tag +wallpaper, title:^([Ww]aytrogen)$"
        "tag +wallpaper, class:^([Ww]aytrogen)$"
        "tag +multimedia, class:^([Aa]udacious)$"
        "tag +settings, title:^(ROG Control)$"
        "tag +settings, class:^(wihotspot(-gui)?)$"
        "tag +settings, class:^([Bb]aobab|org.gnome.[Bb]aobab)$"
        "tag +settings, class:^(gnome-disks|wihotspot(-gui)?)$"
        "tag +settings, title:(Kvantum Manager)"
        "tag +settings, class:^(file-roller|org.gnome.FileRoller)$"
        "tag +settings, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
        "tag +settings, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "tag +settings, class:^(nwg-look|qt5ct|qt6ct|[Yy]ad)$"
        "tag +settings, class:(xdg-desktop-portal-gtk)"
        "tag +settings, class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "tag +settings, class:^([Rr]ofi)$"
        "tag +viewer, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$"
        "tag +viewer, class:^(evince)$"
        "tag +viewer, class:^(eog|org.gnome.Loupe)$"
        # Centering rules
        "center, class:^class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "center, class:^class:^([Ww]hatsapp-for-linux)$"
        "center, class:^class:^([Ff]erdium)$"
        "center, class:([Tt]hunar), title:(File Operation Progress)"
        "center, class:([Tt]hunar), title:(Confirm to replace files)"
        "center, title:^(ROG Control)$"
        "center, title:^(Keybindings)$"
        "center, class:^(system-monitoring-center)$"
        "center, title:Spotify"
        "center, title:^(nixy)"
        "center, class:^(hiddify)$"
        "center, class:^(org.wezfurlong.wezterm|com.mitchellh.ghostty)$"
        "center, class:^(org.pwmt.zathura)$"
        "center, class:^(.protonvpn-app-wrapped)$"
        "center, title:^(Flatseal)$"
        "center, class:^(ghostty-dropterm)$"
        # Floating rules
        "float, class:([Tt]hunar)$"
        "size 1800 1000, class:([Tt]hunar)$"
        "float, title:Spotify"
        "size 1200 900, title:Spotify"
        "float, title:^(nixy)"
        "size 1000 800, title:^(nixy)"
        "float, class:^(hiddify)$"
        "size 1000 800, class:^(hiddify)$"
        "float, class:^(org.pwmt.zathura)$"
        "size 1100 1350, class:^(org.pwmt.zathura)$"
        "float, class:^(.protonvpn-app-wrapped)$"
        "size 600 1200, class:^(.protonvpn-app-wrapped)$"
        "float, title:^(Flatseal)$"
        "size 1400 1000, title:^(Flatseal)$"
        "float, title:mpv"
        "center, title:mpv"
        "float, title:Qv2ray"
        "center, title:Qv2ray"
        "size 1800 1000, title:Qv2ray"
        "size 1800 1000, title:mpv"
        "float, class:^([Ss]potify|[Ww]aypaper|Dolphin|[Ww]aypaper-engine|org.Waytrogen.Waytrogen)$"
        "center, class:^([Ss]potify|[Ww]aypaper|Dolphin|[Ww]aypaper-engine|org.Waytrogen.Waytrogen)$"
        "size 1800 1000, class:^([Ss]potify|[Ww]aypaper|Dolphin|[Ww]aypape-engine|org.Waytrogen.Waytrogen)$"
        "float, class:^(pamac-manager)$"
        "center, class:^(pamac-manager)$"
        "size 1200 1000, class:^(pamac-manager)$"
        "float, title:^(hyprpanel-settings)$"
        "center, title:^(hyprpanel-settings)$"
        "size 1800 1000, title:^(hyprpanel-settings)$"
        "float, title:Dolphin"
        "center, title:Dolphin"
        "size 1800 1000, title:Dolphin"
        "float, class:^(nvidia-settings)$"
        "center, class:^(nvidia-settings)$"
        "size 1000 1000, class:^(nvidia-settings)$"
        # Additional floating rules
        "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float, class:([Zz]oom|onedriver|onedriver-launcher)$"
        "float, class:([Tt]hunar), title:(File Operation Progress)"
        "float, class:([Tt]hunar), title:(Confirm to replace files)"
        "float, class:(org.kde.dolphin)"
        "float, class:(xdg-desktop-portal-gtk)"
        "float, class:(org.gnome.Calculator), title:(Calculator)"
        "float, class:(codium|codium-url-handler|VSCodium|code-oss), title:(Add Folder to Workspace)"
        "float, class:(electron), title:(Add Folder to Workspace)"
        "float, class:^([Rr]ofi)$"
        "float, class:^(eog|org.gnome.Loupe)$"
        "float, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "float, class:^(nwg-look|qt5ct|qt6ct)$"
        "float, class:^(mpv|com.github.rafostar.Clapper)$"
        "float, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
        "float, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$"
        "float, class:^([Yy]ad)$"
        "float, class:^(wihotspot(-gui)?)$"
        "float, class:^(evince)$"
        "float, class:^(file-roller|org.gnome.FileRoller)$"
        "float, class:^([Bb]aobab|org.gnome.[Bb]aobab)$"
        "float, title:(Kvantum Manager)"
        "float, class:^([Ss]team)$,title:^((?![Ss]team).*|[Ss]team [Ss]ettings)$"
        "float, class:^([Qq]alculate-gtk)$"
        "float, class:^([Ww]hatsapp-for-linux)$"
        "float, class:^([Ff]erdium)$"
        "float, title:^(Picture-in-Picture)$"
        "float, title:^(ROG Control)$"
        # Workspace assignments
        "workspace 1, class:^([Tt]hunderbird)$"
        "workspace 2, class:^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable)?)$"
        "workspace 2, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$"
        "workspace 2 silent, class:^([Tt]horium-browser|zen-alpha)$"
        "workspace 4 silent, class:^(com.obsproject.Studio|[Ss]potify)$"
        "workspace 5, class:^([Ss]team)$"
        "workspace 5, class:^([Ll]utris|[Mm]pv)$"
        "workspace 7, class:^([Ff]erdium)$"
        "workspace 7, class:^([Ww]hatsapp-for-linux|[Vv]scodium)$"
        "workspace 5 silent, title:VSCodium"
        "workspace 6 silent, class:^(virt-manager)$"
        "workspace 9 silent, class:^([Aa]udacious)$"
        # Size rules
        "size 70% 70%, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$"
        "size 70% 70%, class:^(xdg-desktop-portal-gtk)$"
        "size 60% 70%, title:(Kvantum Manager)"
        "size 60% 70%, class:^(qt6ct)$"
        "size 70% 70%, class:^(evince|wihotspot(-gui)?)$"
        "size 60% 70%, class:^(file-roller|org.gnome.FileRoller)$"
        "size 60% 70%, class:^([Ww]hatsapp-for-linux)$"
        "size 60% 70%, class:^([Ff]erdium)$"
        "size 60% 70%, title:^(ROG Control)$"
        "size 25% 25%, title:^(Picture-in-Picture)$"
        "pin,title:^(Picture-in-Picture)$"
        "keepaspectratio, title:^(Picture-in-Picture)$"
        # Idle inhibition rules
        "idleinhibit fullscreen, class:^(org.telegram.desktop)$"
        "idleinhibit floating, class:^(org.pwmt.zathura)$"
        "idleinhibit always, class:^(info.febvre.Komikku)$"
        "idleinhibit tile, class:^(info.febvre.Komikku)$"
        "idleinhibit fullscreen, class:^(info.febvre.Komikku)$"
        "idleinhibit focus, class:^(firefox|chromium|librewolf|info.febvre.Komikku)$"
        "idleinhibit focus, class:^(org.pwmt.zathura|info.febvre.Komikku)$"
        "idleinhibit full, class:^(mpv|vlc|celluloid|info.febvre.Komikku)$"
        # Miscellaneous rules
        "idleinhibit fullscreen, class:^(*)$"
        "idleinhibit fullscreen, title:^(*)$"
        "idleinhibit fullscreen, fullscreen:1"
        "suppressevent maximize, class:.*"
      ];
    };

    extraConfig = ''
      # Complex window rules that need exact formatting
      windowrule = move 72% 7%,title:^(Picture-in-Picture)$
      windowrule = opacity 1.0 1.0, class:^([Ss]potify)$
      windowrule = opacity 0.9 0.6, class:^([Rr]ofi)$
      windowrule = opacity 1.0 1.0, class:^(Brave-browser(-beta|-dev)?)$
      windowrule = opacity 1.0 1.0, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$
      windowrule = opacity 0.9 0.7, class:^(zen-alpha)$
      windowrule = opacity 0.9 0.6, class:^([Tt]horium-browser)$
      windowrule = opacity 0.9 0.8, class:^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable)?)$
      windowrule = opacity 0.9 0.8, class:^(google-chrome(-beta|-dev|-unstable)?)$
      windowrule = opacity 0.94 0.86, class:^(chrome-.+-Default)$
      windowrule = opacity 0.9 0.8, class:^([Tt]hunar|org.gnome.Nautilus)$
      windowrule = opacity 0.8 0.6, class:^(pcmanfm-qt)$
      windowrule = opacity 0.8 0.7, class:^(gedit|org.gnome.TextEditor|mousepad)$
      windowrule = opacity 0.9 0.8, class:^(deluge)$
      windowrule = opacity 0.9 0.8, class:^(firefox|org.wezfurlong.wezterm|foot|com.mitchellh.ghostty|Alacritty|kitty|kitty-dropterm|equibop)$
      windowrule = opacity 0.7 0.9, class:^(VSCodium|codium-url-handler|code-oss)$
      windowrule = opacity 0.9 0.8, class:^(nwg-look|qt5ct|qt6ct|[Yy]ad)$
      windowrule = opacity 0.9 0.8, title:(Kvantum Manager)
      windowrule = opacity 0.9 0.7, class:^(com.obsproject.Studio)$
      windowrule = opacity 0.9 0.7, class:^([Aa]udacious)$
      windowrule = opacity 0.9 0.8, class:^(VSCode|code-url-handler)$
      windowrule = opacity 0.9 0.8, class:^(jetbrains-.+)$
      windowrule = opacity 1.0 0.98, class:^([Dd]iscord|[Vv]esktop)$
      windowrule = opacity 0.9 0.8, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$
      windowrule = opacity 0.9 0.8, class:^(im.riot.Riot)$
      windowrule = opacity 0.94 0.86, class:^(gnome-disks|evince|wihotspot(-gui)?|org.gnome.baobab)$
      windowrule = opacity 0.9 0.8, class:^(file-roller|org.gnome.FileRoller)$
      windowrule = opacity 0.8 0.7, class:^(app.drey.Warp)$
      windowrule = opacity 0.9 0.8, class:^(seahorse)$
      windowrule = opacity 0.82 0.75, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$
      windowrule = opacity 0.9 0.8, class:^(xdg-desktop-portal-gtk)$
      windowrule = opacity 0.9 0.7, class:^([Ww]hatsapp-for-linux)$
      windowrule = opacity 0.9 0.7, class:^([Ff]erdium)$
      windowrule = opacity 0.95 0.75, title:^(Picture-in-Picture)$
    '';
  };
}
