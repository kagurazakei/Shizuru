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
      wheelNeedsPassword = false;
      extraConfig = ''
        Defaults pwfeedback
        Defaults env_keep += "EDITOR PATH DISPLAY"
        Defaults passprompt = "[sudo 󱅞 ]: "
      '';
    };
  };
}
