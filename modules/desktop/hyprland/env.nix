{...}: {
  hj.rum.desktops.hyprland = {
    settings = {
      env = [
        "EDITOR,nvim"
        "TERMINAL,wezterm"
        "BROWSER,firefox"
        "GDK_BACKEND,wayland,x11,*"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"
        "QT_WAYLAND_RECONNECT,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XCURSOR_THEME,Matcha-Fou"
        "XCURSOR_SIZE,30"
        "HYPRCURSOR_THEME,Matcha-Fou"
        "HYPRCURSOR_SIZE,30"
        "GDK_SCALE,1"
        "MOZ_ENABLE_WAYLAND,1"
        "QT_QUICK_CONTROLS_STYLE,org.hyprland.style"
        "GTK_THEME,Material-DeepOcean-BL-LB"
        "QT_STYLE_OVERRIDE,kvantum"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "OZONE_PLATFORM,wayland"
        "LIBVA_DRIVER_NAME,iHD"
        "GBM_BACKEND,intel-drm"
        "WLR_DRM_NO_ATOMIC,1"
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "MOZ_DISABLE_RDD_SANDBOX,1"
        "EGL_PLATFORM,wayland"
      ];

      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
