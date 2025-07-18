{ ...
}: {
  rum.programs.hyprpanel = {
    enable = true;
    systemd.enable = false;
    hyprland.enable = false;
    # Put color-related config in override
    themeName = "catppuccin_mocha";

    override = {
      "theme.notification.background" = "#181826";
      "theme.notification.close_button.background" = "#f38ba7";
      "theme.notification.actions.background" = "#b4befd";
      "theme.notification.actions.text" = "#181825";

      "theme.bar.buttons.notifications.background" = "#ff727b";
      "theme.bar.buttons.notifications.total" = "#11111b";
      "theme.bar.buttons.notifications.icon" = "#11111b";

      "theme.bar.buttons.modules.updates.background" = "#7aa1fa";
      "theme.bar.buttons.modules.updates.text" = "#11111b";
      "theme.bar.buttons.modules.updates.icon" = "#11111b";

      "theme.bar.buttons.modules.power.icon" = "#11111b";
      "theme.bar.buttons.modules.power.icon_background" = "#ff9e67";
      "theme.bar.buttons.modules.power.background" = "#ff9e67";

      "theme.bar.buttons.dashboard.background" = "#b6f9f5";
      "theme.bar.buttons.dashboard.icon" = "#11111b";

      "theme.bar.buttons.systray.background" = "#242438";

      "theme.bar.buttons.clock.icon_background" = "#242438";
      "theme.bar.buttons.clock.background" = "#c3e88e";
      "theme.bar.buttons.clock.text" = "#11111b";
      "theme.bar.buttons.clock.icon" = "#11111b";

      "theme.bar.buttons.workspaces.background" = "#11111b";
      "theme.bar.buttons.workspaces.hover" = "#f7768e";
      "theme.bar.buttons.workspaces.available" = "#89dceb";
      "theme.bar.buttons.workspaces.occupied" = "#89dceb";
      "theme.bar.buttons.workspaces.active" = "#f7768e";

      "theme.bar.menus.menu.notifications.card" = "#1e1e2e";
      "theme.bar.menus.menu.notifications.label" = "#b4befe";
    };

    # Non-color config goes to settings
    settings = {
      bar.layouts = {
        "0" = {
          left = [ "dashboard" "windowtitle" "volume" "cava" "systray" ];
          middle = [ "notifications" "workspaces" "updates" ];
          right = [ "media" "network" "clock" "bluetooth" "battery" "power" ];
        };
      };
      bar.customModules.updates.pollingInterval = 1440000;
      theme.bar.scaling = 85;
      scalingPriority = "both";
      tear = true;
      menus.transition = "crossfade";
      theme.notification.scaling = 80;
      theme.osd.scaling = 80;
      theme.bar.menus.menu.dashboard.scaling = 75;
      theme.bar.menus.menu.dashboard.confirmation_scaling = 80;
      theme.bar.menus.menu.media.scaling = 80;
      theme.bar.menus.menu.volume.scaling = 80;
      theme.bar.menus.menu.network.scaling = 80;
      theme.bar.menus.menu.bluetooth.scaling = 80;
      theme.bar.menus.menu.battery.scaling = 80;
      theme.bar.menus.menu.clock.scaling = 80;
      theme.bar.menus.menu.notifications.scaling = 80;
      theme.bar.menus.menu.power.scaling = 80;
      theme.tooltip.scaling = 80;
      theme.bar.menus.popover.scaling = 80;
      theme.font.weight = 500;
      theme.bar.floating = true;
      theme.bar.location = "top";
      bar.autoHide = "never";
      theme.bar.buttons.enableBorders = true;
      theme.font.name = "JetBrainsMono Nerd Font";
      theme.font.size = "0.95rem";
      bar.workspaces.show_icons = false;
      bar.workspaces.show_numbered = false;
      bar.workspaces.workspaceMask = false;
      bar.workspaces.showWsIcons = false;
      bar.workspaces.showApplicationIcons = true;
      bar.workspaces.reverse_scroll = true;
      theme.bar.buttons.systray.enableBorder = false;
      menus.clock.time.hideSeconds = true;
      menus.clock.weather.enabled = false;
      bar.clock.format = "%I:%M %p";
      theme.bar.buttons.modules.storage.enableBorder = false;
      menus.dashboard.powermenu.avatar.name = "shizuru";
      menus.dashboard.shortcuts.left.shortcut1.command = "zen-browser";
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Zen-Browser";
      menus.dashboard.shortcuts.left.shortcut1.icon = "󰈹";
      menus.dashboard.powermenu.avatar.image = "/home/antonio/Pictures/wallpapers/berserk-1359162.png";
      menus.dashboard.shortcuts.left.shortcut3.command = "vesktop";
      theme.matugen_settings.scheme_type = "expressive";
      theme.matugen_settings.variation = "standard_2";
      theme.matugen_settings.mode = "dark";
      theme.matugen = false;
      wallpaper.image = "";
      wallpaper.enable = false;
      bar.launcher.icon = "󰊠";
      bar.launcher.autoDetectIcon = false;
      theme.bar.buttons.dashboard.enableBorder = false;
      theme.bar.buttons.modules.updates.enableBorder = false;
      menus.dashboard.shortcuts.left.shortcut4.command = "rofi -show drun -theme \"$HOME/.config/rofi/menu.rasi\"";
      notifications.position = "top";

      notifications.cache_actions = true;
      notifications.timeout = 2000;
      notifications.clearDelay = 0;
      theme.bar.menus.menu.notifications.pager.show = false;
      notifications.displayedTotal = 4;
      theme.bar.menus.menu.notifications.scrollbar.width = "0.35em";
      notifications.showActionsOnHover = true;
      theme.bar.buttons.workspaces.enableBorder = true;
      bar.workspaces.numbered_active_indicator = "underline";
      theme.bar.buttons.modules.cpu.enableBorder = false;
      theme.bar.buttons.modules.ram.enableBorder = false;
      bar.notifications.show_total = false;
      bar.customModules.cava.showActiveOnly = true;
      bar.customModules.cava.icon = "";
      bar.customModules.updates.leftClick = "/home/nyx/.config/Scripts/update.sh";

      theme.bar.buttons.borderSize = "0.05em";
      theme.bar.border.width = "0.05em";
      theme.osd.location = "right";
      theme.osd.enableShadow = true;
      theme.notification.enableShadow = true;
      theme.bar.buttons.spacing = "0.3em";
      theme.bar.buttons.padding_x = "0.9rem";
      bar.windowtitle.leftClick = "agsv1 -t overview";
      bar.workspaces.monitorSpecific = false;
      bar.workspaces.ignored = "[-99]";
      bar.workspaces.workspaces = 3;
      theme.bar.buttons.workspaces.pill.radius = "0.6rem * 0.2";
      theme.bar.buttons.workspaces.pill.height = "4.5em";
      theme.bar.buttons.workspaces.pill.width = "6.5em";
      theme.bar.buttons.workspaces.pill.active_width = "12em";
      bar.workspaces.spacing = 1.0;
      theme.bar.buttons.workspaces.fontSize = "1.2em";
      bar.media.format = "{title}";
      theme.bar.buttons.media.spacing = "0.5em";
      bar.media.truncation_size = 15;
      bar.media.show_active_only = false;
      theme.bar.opacity = 90;
      theme.bar.outer_spacing = "0.4em";
      theme.bar.buttons.y_margins = "0.7em";
      theme.bar.margin_top = "0.2em";
      theme.bar.margin_sides = "5.5em";
    };
  };
}
