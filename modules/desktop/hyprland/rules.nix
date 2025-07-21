{...}: {
  hj.rum.desktops.hyprland = {
    settings = {
      "$scratchpadsize" = "size 60% 65%";
      "$scratchpad" = "class:^(scratchpad.foo)$";
    };

    windowRules = [
      # Scratchpad rules
      {rule = "float, $scratchpad";}
      {rule = "center, $scratchpad";}

      # Browser tagging
      {rule = "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$";}
      {rule = "tag +browser, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$";}
      {rule = "tag +browser, class:^(chrome-.+-Default)$";} # Chrome PWAs
      {rule = "tag +browser, class:^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable))$";}
      {rule = "tag +browser, class:^(Brave-browser(-beta|-dev|-unstable)?)$";}
      {rule = "tag +browser, class:^([Tt]horium-browser|[Cc]achy-browser)$";}
      {rule = "tag +browser, class:^(zen-alpha)$";}

      # Application tagging
      {rule = "tag +terminal, class:^(Alacritty|kitty|kitty-dropterm)$";}
      {rule = "tag +email, class:^([Tt]hunderbird|org.gnome.Evolution)$";}
      {rule = "tag +email, class:^(eu.betterbird.Betterbird)$";}
      {rule = "tag +projects, class:^(codium|codium-url-handler|VSCodium)$";}
      {rule = "tag +projects, class:^(VSCode|code-url-handler)$";}
      {rule = "tag +projects, class:^(jetbrains-.+)$";} # JetBrains IDEs
      {rule = "tag +screenshare, class:^(com.obsproject.Studio)$";}
      {rule = "tag +im, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$";}
      {rule = "tag +im, class:^([Ff]erdium)$";}
      {rule = "tag +im, class:^([Ww]hatsapp-for-linux)$";}
      {rule = "tag +im, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$";}
      {rule = "tag +im, class:^(teams-for-linux)$";}
      {rule = "tag +games, class:^(gamescope)$";}
      {rule = "tag +games, class:^(steam_app_\\d+)$";}
      {rule = "tag +gamestore, class:^([Ss]team)$";}
      {rule = "tag +gamestore, title:^([Ll]utris)$";}
      {rule = "tag +gamestore, class:^(com.heroicgameslauncher.hgl)$";}
      {rule = "tag +file-manager, class:^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$";}
      {rule = "tag +file-manager, class:^(app.drey.Warp)$";}
      {rule = "tag +wallpaper, title:^([Ww]aytrogen)$";}
      {rule = "tag +wallpaper, class:^([Ww]aytrogen)$";}
      {rule = "tag +multimedia, class:^([Aa]udacious)$";}
      {rule = "tag +settings, title:^(ROG Control)$";}
      {rule = "tag +settings, class:^(wihotspot(-gui)?)$";} # wifi hotspot
      {rule = "tag +settings, class:^([Bb]aobab|org.gnome.[Bb]aobab)$";} # Disk usage analyzer
      {rule = "tag +settings, class:^(gnome-disks|wihotspot(-gui)?)$";}
      {rule = "tag +settings, title:(Kvantum Manager)";}
      {rule = "tag +settings, class:^(file-roller|org.gnome.FileRoller)$";} # archive manager
      {rule = "tag +settings, class:^(nm-applet|nm-connection-editor|blueman-manager)$";}
      {rule = "tag +settings, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$";}
      {rule = "tag +settings, class:^(nwg-look|qt5ct|qt6ct|[Yy]ad)$";}
      {rule = "tag +settings, class:(xdg-desktop-portal-gtk)";}
      {rule = "tag +settings, class:^(org.kde.polkit-kde-authentication-agent-1)$";}
      {rule = "tag +settings, class:^([Rr]ofi)$";}
      {rule = "tag +viewer, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$";} # system monitor
      {rule = "tag +viewer, class:^(evince)$";} # document viewer
      {rule = "tag +viewer, class:^(eog|org.gnome.Loupe)$";} # image viewer

      # Centering rules
      {rule = "center, class:^class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$";}
      {rule = "center, class:^class:^([Ww]hatsapp-for-linux)$";}
      {rule = "center, class:^class:^([Ff]erdium)$";}
      {rule = "center, class:([Tt]hunar), title:(File Operation Progress)";}
      {rule = "center, class:([Tt]hunar), title:(Confirm to replace files)";}
      {rule = "center, title:^(ROG Control)$";}
      {rule = "center, title:^(Keybindings)$";}
      {rule = "center, class:^(system-monitoring-center)$";}
      {rule = "center, title:Spotify";}
      {rule = "center, title:^(nixy)";}
      {rule = "center, class:^(hiddify)$";}
      {rule = "center, class:^(org.wezfurlong.wezterm|com.mitchellh.ghostty)$";}
      {rule = "center, class:^(org.pwmt.zathura)$";}
      {rule = "center, class:^(.protonvpn-app-wrapped)$";}
      {rule = "center, title:^(Flatseal)$";}
      {rule = "center, class:^(ghostty-dropterm)$";}

      # Floating rules
      {rule = "float, class:([Tt]hunar)$";}
      {rule = "size 1800 1000, class:([Tt]hunar)$";}
      {rule = "move 72% 7%,title:^(Picture-in-Picture)$";}
      {rule = "float, title:Spotify";}
      {rule = "size 1200 900, title:Spotify";}
      {rule = "float, title:^(nixy)";}
      {rule = "size 1000 800, title:^(nixy)";}
      {rule = "float, class:^(hiddify)$";}
      {rule = "size 1000 800, class:^(hiddify)$";}
      {rule = "float, class:^(org.pwmt.zathura)$";}
      {rule = "size 1100 1350, class:^(org.pwmt.zathura)$";}
      {rule = "float, class:^(.protonvpn-app-wrapped)$";}
      {rule = "size 600 1200, class:^(.protonvpn-app-wrapped)$";}
      {rule = "float, title:^(Flatseal)$";}
      {rule = "size 1400 1000, title:^(Flatseal)$";}
      {rule = "float, class:^(ghostty-dropterm)$";}
      {rule = "float, title:mpv";}
      {rule = "center, title:mpv";}
      {rule = "float, title:Qv2ray";}
      {rule = "center, title:Qv2ray";}
      {rule = "size 1800 1000, title:Qv2ray";}
      {rule = "size 1800 1000, title:mpv";}
      {rule = "float, class:^([Ss]potify|[Ww]aypaper|Dolphin|[Ww]aypaper-engine|org.Waytrogen.Waytrogen)$";}
      {rule = "center, class:^([Ss]potify|[Ww]aypaper|Dolphin|[Ww]aypaper-engine|org.Waytrogen.Waytrogen)$";}
      {rule = "size 1800 1000, class:^([Ss]potify|[Ww]aypaper|Dolphin|[Ww]aypape-engine|org.Waytrogen.Waytrogen)$";}
      {rule = "float, class:^(pamac-manager)$";}
      {rule = "center, class:^(pamac-manager)$";}
      {rule = "size 1200 1000, class:^(pamac-manager)$";}
      {rule = "float, title:^(hyprpanel-settings)$";}
      {rule = "center, title:^(hyprpanel-settings)$";}
      {rule = "size 1800 1000, title:^(hyprpanel-settings)$";}
      {rule = "float, title:Dolphin";}
      {rule = "center, title:Dolphin";}
      {rule = "size 1800 1000, title:Dolphin";}
      {rule = "float, class:^(nvidia-settings)$";}
      {rule = "center, class:^(nvidia-settings)$";}
      {rule = "size 1000 1000, class:^(nvidia-settings)$";}

      # Workspace assignments
      {rule = "workspace 1, class:^([Tt]hunderbird)$";}
      {rule = "workspace 2, class:^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable)?)$";}
      {rule = "workspace 2, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$";}
      {rule = "workspace 2 silent, class:^([Tt]horium-browser|zen-alpha)$";}
      {rule = "workspace 4 silent, class:^(com.obsproject.Studio|[Ss]potify)$";}
      {rule = "workspace 5, class:^([Ss]team)$";}
      {rule = "workspace 5, class:^([Ll]utris|[Mm]pv)$";}
      {rule = "workspace 7, class:^([Ff]erdium)$";}
      {rule = "workspace 7, class:^([Ww]hatsapp-for-linux|[Vv]scodium)$";}
      {rule = "workspace 5 silent, title:VSCodium";}
      {rule = "workspace 6 silent, class:^(virt-manager)$";}
      {rule = "workspace 9 silent, class:^([Aa]udacious)$";}

      # Additional floating rules
      {rule = "float, class:^(org.kde.polkit-kde-authentication-agent-1)$";}
      {rule = "float, class:([Zz]oom|onedriver|onedriver-launcher)$";}
      {rule = "float, class:([Tt]hunar), title:(File Operation Progress)";}
      {rule = "float, class:([Tt]hunar), title:(Confirm to replace files)";}
      {rule = "float, class:(org.kde.dolphin)";}
      {rule = "float, class:(xdg-desktop-portal-gtk)";}
      {rule = "float, class:(org.gnome.Calculator), title:(Calculator)";}
      {rule = "float, class:(codium|codium-url-handler|VSCodium|code-oss), title:(Add Folder to Workspace)";}
      {rule = "float, class:(electron), title:(Add Folder to Workspace)";}
      {rule = "float, class:^([Rr]ofi)$";}
      {rule = "float, class:^(eog|org.gnome.Loupe)$";} # image viewer
      {rule = "float, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$";}
      {rule = "float, class:^(nwg-look|qt5ct|qt6ct)$";}
      {rule = "float, class:^(mpv|com.github.rafostar.Clapper)$";}
      {rule = "float, class:^(nm-applet|nm-connection-editor|blueman-manager)$";}
      {rule = "float, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$";} # system monitor
      {rule = "float, class:^([Yy]ad)$";}
      {rule = "float, class:^(wihotspot(-gui)?)$";} # wifi hotspot
      {rule = "float, class:^(evince)$";} # document viewer
      {rule = "float, class:^(file-roller|org.gnome.FileRoller)$";} # archive manager
      {rule = "float, class:^([Bb]aobab|org.gnome.[Bb]aobab)$";} # Disk usage analyzer
      {rule = "float, title:(Kvantum Manager)";}
      {rule = "float, class:^([Ss]team)$,title:^((?![Ss]team).*|[Ss]team [Ss]ettings)$";}
      {rule = "float, class:^([Qq]alculate-gtk)$";}
      {rule = "float, class:^([Ww]hatsapp-for-linux)$";}
      {rule = "float, class:^([Ff]erdium)$";}
      {rule = "float, title:^(Picture-in-Picture)$";}
      {rule = "float, title:^(ROG Control)$";}

      # Opacity rules
      {rule = "opacity 1.0 1.0, class:^([Ss]potify)$";}
      {rule = "opacity 0.9 0.6, class:^([Rr]ofi)$";}
      {rule = "opacity 1.0 1.0, class:^(Brave-browser(-beta|-dev)?)$";}
      {rule = "opacity 1.0 1.0, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$";}
      {rule = "opacity 0.9 0.7, class:^(zen-alpha)$";} # zen browser
      {rule = "opacity 0.9 0.6, class:^([Tt]horium-browser)$";}
      {rule = "opacity 0.9 0.8, class:^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable)?)$";}
      {rule = "opacity 0.9 0.8, class:^(google-chrome(-beta|-dev|-unstable)?)$";}
      {rule = "opacity 0.94 0.86, class:^(chrome-.+-Default)$";} # Chrome PWAs
      {rule = "opacity 0.9 0.8, class:^([Tt]hunar|org.gnome.Nautilus)$";}
      {rule = "opacity 0.8 0.6, class:^(pcmanfm-qt)$";}
      {rule = "opacity 0.8 0.7, class:^(gedit|org.gnome.TextEditor|mousepad)$";}
      {rule = "opacity 0.9 0.8, class:^(deluge)$";}
      {rule = "opacity 0.95 0.96, class:^(firefox|org.wezfurlong.wezterm|foot|com.mitchellh.ghostty|Alacritty|kitty|kitty-dropterm|equibop)$";} # Terminals
      {rule = "opacity 0.7 0.9, class:^(VSCodium|codium-url-handler|code-oss)$";}
      {rule = "opacity 0.9 0.8, class:^(nwg-look|qt5ct|qt6ct|[Yy]ad)$";}
      {rule = "opacity 0.9 0.8, title:(Kvantum Manager)";}
      {rule = "opacity 0.9 0.7, class:^(com.obsproject.Studio)$";}
      {rule = "opacity 0.9 0.7, class:^([Aa]udacious)$";}
      {rule = "opacity 0.9 0.8, class:^(VSCode|code-url-handler)$";}
      {rule = "opacity 0.9 0.8, class:^(jetbrains-.+)$";} # JetBrains IDEs
      {rule = "opacity 1.0 0.98, class:^([Dd]iscord|[Vv]esktop)$";}
      {rule = "opacity 0.9 0.8, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$";}
      {rule = "opacity 0.9 0.8, class:^(im.riot.Riot)$";} # Element matrix client
      {rule = "opacity 0.94 0.86, class:^(gnome-disks|evince|wihotspot(-gui)?|org.gnome.baobab)$";}
      {rule = "opacity 0.9 0.8, class:^(file-roller|org.gnome.FileRoller)$";} # archive manager
      {rule = "opacity 0.8 0.7, class:^(app.drey.Warp)$";} # Warp file transfer
      {rule = "opacity 0.9 0.8, class:^(seahorse)$";} # gnome-keyring gui
      {rule = "opacity 0.82 0.75, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$";}
      {rule = "opacity 0.9 0.8, class:^(xdg-desktop-portal-gtk)$";} # gnome-keyring gui
      {rule = "opacity 0.9 0.7, class:^([Ww]hatsapp-for-linux)$";}
      {rule = "opacity 0.9 0.7, class:^([Ff]erdium)$";}
      {rule = "opacity 0.95 0.75, title:^(Picture-in-Picture)$";}

      # Size rules
      {rule = "size 70% 70%, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$";}
      {rule = "size 70% 70%, class:^(xdg-desktop-portal-gtk)$";}
      {rule = "size 60% 70%, title:(Kvantum Manager)";}
      {rule = "size 60% 70%, class:^(qt6ct)$";}
      {rule = "size 70% 70%, class:^(evince|wihotspot(-gui)?)$";}
      {rule = "size 60% 70%, class:^(file-roller|org.gnome.FileRoller)$";}
      {rule = "size 60% 70%, class:^([Ww]hatsapp-for-linux)$";}
      {rule = "size 60% 70%, class:^([Ff]erdium)$";}
      {rule = "size 60% 70%, title:^(ROG Control)$";}
      {rule = "size 25% 25%, title:^(Picture-in-Picture)$";}
      {rule = "pin,title:^(Picture-in-Picture)$";}
      {rule = "keepaspectratio, title:^(Picture-in-Picture)$";}

      # Idle inhibition rules
      {rule = "idleinhibit fullscreen, class:^(org.telegram.desktop)$";}
      {rule = "idleinhibit floating, class:^(org.pwmt.zathura)$";}
      {rule = "idleinhibit always, class:^(info.febvre.Komikku)$";}
      {rule = "idleinhibit tile, class:^(info.febvre.Komikku)$";}
      {rule = "idleinhibit fullscreen, class:^(info.febvre.Komikku)$";}
      {rule = "idleinhibit focus, class:^(firefox|chromium|librewolf|info.febvre.Komikku)$";}
      {rule = "idleinhibit focus, class:^(org.pwmt.zathura|info.febvre.Komikku)$";}
      {rule = "idleinhibit full, class:^(mpv|vlc|celluloid|info.febvre.Komikku)$";}

      # Layer rules
      {rule = "layerrule = unset,class:^([Rr]ofi)$";}
      {rule = "layerrule = blur,class:^([Rr]ofi)$";}
      {rule = "layerrule = ignorezero, <rofi>";}
      {rule = "layerrule = noanim, ax-shell";}
      {rule = "layerrule = noanim, fabric";}
      {rule = "layerrule = noanim, run-widget";}
      {rule = "layerrule = ignorezero, ax-shell";}
      {rule = "layerrule = ignorezero, overview";}
      {rule = "layerrule = blur, overview";}
      {rule = "layerrule = blur ,gtk-layer-shell";}
      {rule = "layerrule = blur ,fuzzel";}
      {rule = "layerrule = ignorezero ,gtk-layer-shell";}
      {rule = "layerrule = ignorealpha, ^(notificationsmenu|audiomenu|mediamenu)$";}
      {rule = "layerrule = noanim, caelestia-(launcher|osd|notifications|border-exclusion|area-picker)";}
      {rule = "layerrule = animation fade, caelestia-(drawers|background)";}
      {rule = "layerrule = order 1, caelestia-border-exclusion";}
      {rule = "layerrule = order 2, caelestia-bar";}
      {rule = "layerrule = xray 1, caelestia-(border|launcher|bar|sidebar|navbar|mediadisplay|screencorners)";}
      {rule = "layerrule = blur, caelestia-.*";}
      {rule = "layerrule = blurpopups, caelestia-.*";}
      {rule = "layerrule = ignorealpha 0.57, caelestia-.*";}
      {rule = "layerrule = animation fade, qs";}
      {rule = "layerrule = animation fade, quickshell";}

      # Miscellaneous rules
      {rule = "idleinhibit fullscreen, class:^(*)$";}
      {rule = "idleinhibit fullscreen, title:^(*)$";}
      {rule = "idleinhibit fullscreen, fullscreen:1";}
      {rule = "suppressevent maximize, class:.*";}
    ];
  };
}
