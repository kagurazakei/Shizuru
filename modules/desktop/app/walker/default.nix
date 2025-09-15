{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.walker.nixosModules.walker
  ];
  programs.walker = {
    enable = true;
    runAsService = true;
  };
  services.elephant = {
    enable = true;
  };
  hj.files = {
    ".config/walker/config.toml".source = "${./config/config.toml}";
    ".config/walker/themes".source = "${./themes}";
  };
}
