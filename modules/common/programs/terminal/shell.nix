{pkgs, ...}: {
  hj = {
    packages = with pkgs; [
      bat
    ];
    rum.programs = {
      lsd.enable = true;
    };
  };
}
