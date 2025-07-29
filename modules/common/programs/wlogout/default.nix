{
  pkgs,
  config,
  lib,
  username,
  ...
}: let
  logoutAction = "uwsm stop";
  homeDir = "/home/${username}";
  customWlogout = pkgs.writeShellScriptBin "wlogout" ''
    ${pkgs.wlogout}/bin/wlogout \
      --protocol layer-shell \
      -b 5 \
      -T 300 \
      -B 300 \
      -l ${homeDir}/.config/wlogout/layout \
      -C ${homeDir}/.config/wlogout/style.css \
      -r 5 \
      -c 30
  '';
in {
  imports = [
    ./wleave.nix
  ];
  options.mine.wlogout.enable = lib.mkEnableOption "wlogout";
  config = lib.mkIf config.mine.wlogout.enable {
    hj = {
      packages = [
        customWlogout
        pkgs.wlogout
      ];

      files = {
        ".config/wlogout/layout" = {
          text = ''

            {
              "label": "shutdown",
              "action": "systemctl poweroff",
              "text": "Shutdown",
              "keybind": "s"
            },
            {
              "label": "reboot",
              "action": "systemctl reboot",
              "text": "Reboot",
              "keybind": "r"
            },
            {
              "label": "lock",
              "action": "loginctl lock-session",
              "text": "Lock",
              "keybind": "l"
            },
            {
              "label": "suspend",
              "action": "systemctl suspend",
              "text": "Suspend",
              "keybind": "u"
            },
            {
              "label": "logout",
              "action": "${logoutAction}",
              "text": "Logout",
              "keybind": "e"
            }

          '';
        };

        ".config/wlogout/style.css" = {
          text = ''
            @import '${./colors.css}';
            window {
                font-family: JetBrainsMono Nerd Font;
                font-size: 16pt;
                color: @foreground; /* text */
                background-color: rgba(30, 30, 46, 0.8);
            }

            button {
                background-repeat: no-repeat;
                background-position: center;
                background-size: 20%;
                background-color: transparent;
                animation: gradient_f 20s ease-in infinite;
                transition: all 0.3s ease-in;
                box-shadow: 0 0 10px 2px transparent;
                border-radius: 36px;
                margin: 10px;
                border: 4px solid #69ff94;
            }

            button:focus {
                box-shadow: none;
                background-size: 20%;
            }

            button:hover {
                background-size: 50%;
                box-shadow: 0 0 10px 3px rgba(0,0,0,.4);
                background-color: @color7;
                color: transparent;
                transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.5s ease-in;
            }

            #shutdown {
                background-image: image(url("${./icons/power.png}"));
            }
            #shutdown:hover {
              background-image: image(url("${./icons/power-hover.png}"));
            }

            #logout {
                background-image: image(url("${./icons/logout.png}"));
            }
            #logout:hover {
              background-image: image(url("${./icons/logout-hover.png}"));
            }

            #reboot {
                background-image: image(url("${./icons/restart.png}"));
            }
            #reboot:hover {
              background-image: image(url("${./icons/restart-hover.png}"));
            }

            #lock {
                background-image: image(url("${./icons/lock.png}"));
            }
            #lock:hover {
              background-image: image(url("${./icons/lock-hover.png}"));
            }

            #suspend {
                background-image: image(url("${./icons/hibernate.png}"));
            }
            #suspend:hover {
              background-image: image(url("${./icons/hibernate-hover.png}"));
            }
          '';
        };
      };
    };
  };
}
