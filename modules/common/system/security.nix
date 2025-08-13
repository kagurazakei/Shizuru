{username, ...}: {
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.pam.services.hyprlock = {
    text = ''
      auth include login
    '';
  };
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
  security = {
    sudo = {
      enable = true;
      extraRules = [
        {
          users = ["antonio"];
          commands = [
            {
              command = "/run/current-system/sw/bin/nixos-rebuild";
              options = ["SETENV" "NOPASSWD"];
            }
            {
              command = "/run/current-system/sw/bin/nh";
              options = ["SETENV" "NOPASSWD"];
            }
          ];
        }
      ];
      extraConfig = ''
        Defaults pwfeedback
        Defaults env_keep += "EDITOR PATH DISPLAY"
        Defaults passprompt = "[sudo 󱅞 ]: "
      '';
    };
  };
}
