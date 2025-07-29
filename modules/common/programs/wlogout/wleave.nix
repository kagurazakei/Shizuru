{
  pkgs,
  config,
  lib,
  username,
  ...
}: let
  logoutAction = "uwsm stop";
  homeDir = "/home/${username}";
  customWleave = pkgs.writeShellScriptBin "wleave" ''
    ${pkgs.wleave}/bin/wleave \
      --protocol layer-shell \
      -b 5 \
      -T 300 \
      -B 300 \
      -l ${homeDir}/.config/wleave/layout.json \
      -C ${homeDir}/.config/wleave/style.css \
      -r 5 \
      -c 30
  '';
in {
  options.mine.wleave.enable = lib.mkEnableOption "wleave";
  config = lib.mkIf config.mine.wleave.enable {
    hj = {
      packages = [
        customWleave
        pkgs.master.wleave
      ];
      files = {
        ".config/wleave/layout.json".source = (pkgs.formats.json {}).generate "wleave-layout" {
          buttons = [
            {
              label = "shutdown";
              action = "systemctl poweroff";
              text = "Shutdown";
              keybind = "s";
            }
            {
              label = "reboot";
              action = "systemctl reboot";
              text = "Reboot";
              keybind = "r";
            }
            {
              label = "lock";
              action = "loginctl lock-session";
              text = "Lock";
              keybind = "l";
            }
            {
              label = "suspend";
              action = "systemctl suspend";
              text = "Suspend";
              keybind = "u";
            }
            {
              label = "logout";
              action = "${logoutAction}";
              text = "Logout";
              keybind = "e";
            }
          ];
        };
        ".config/wleave/style.css".text =
          # css
          ''
            @import url("${./colors.css}");

            window {
            	font-family: JetBrainsMono Nerd Font;
            	font-size: 20pt;
            	color: #c0caf5;
            	/* text */
            	background-color: @background;
            }

            button {
            	border-radius: 10px;
            	background-repeat: no-repeat;
            	background-position: center;
            	background-size: 50%;
            	border: none;
            	background-color: transparent;
            	margin: 5px;
            	transition:
            		box-shadow 0.1s ease-in-out,
            		background-color 0.1s ease-in-out;
            }

            button:hover {
            	background-color: @color0;
            }

            button:focus {
            	background-color: @color1;
            	color: @foreground;
            }

            #lock {
            	background-image: url("${./icons/lock.png}");
            }

            #lock:focus {
            	background-image: url("${./icons/lock-hover.png}");
            }

            #logout {
            	background-image: url("${./icons/logout.png}");
            }

            #logout:focus {
            	background-image: url("${./icons/logout-hover.png}");
            }

            #suspend {
            	background-image: url("${./icons/sleep.png}");
            }

            #suspend:focus {
            	background-image: url("${./icons/sleep-hover.png}");
            }

            #shutdown {
            	background-image: url("${./icons/power.png}");
            }

            #shutdown:focus {
            	background-image: url("${./icons/power-hover.png}");
            }

            #reboot {
            	background-image: url("${./icons/restart.png}");
            }

            #reboot:focus {
            	background-image: url("${./icons/restart-hover.png}");
            }
          '';
      };
    };
  };
}
