{ pkgs
, ...
}: {
  hj = {
    packages = with pkgs; [
      zoxide
      fzf
      fd
      bat
      lazygit
      starship
    ];
    rum.programs = {
      lsd.enable = true;
    };
  };
}
