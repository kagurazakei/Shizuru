{...}: {
  # Enable fingerprint scanner
  services.fprintd = {
    enable = true;
    tod.enable = true;
    #tod.driver = pkgs.libfprint-2-tod1-goodix;
    #tod.driver = pkgs.libfprint-2-tod1-vfs0090;
  };
}
