{ inputs
, ...
}: {
  hm = {
    imports = [
      inputs.wayland-pipewire-idle-inhibit.homeModules.default
    ];
    services.wayland-pipewire-idle-inhibit = {
      enable = true;
      systemdTarget = "graphical-session.target";
      settings = {
        verbosity = "INFO";
        media_minimum_duration = 10;
        idle_inhibitor = "wayland";
        sink_whitelist = [
          { name = "Starship/Matisse HD Audio Controller Analog Stereo"; }
        ];
        node_blacklist = [
          { name = "spotify"; }
          { app_name = "Music Player Daemon"; }
        ];
      };
    };
  };
}
