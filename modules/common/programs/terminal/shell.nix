{pkgs, ...}: {
  hj = {
    packages = with pkgs; [
      fzf
      fd
      bat
      lazygit
    ];
    rum.programs = {
      lsd.enable = true;
    };
  };
}
