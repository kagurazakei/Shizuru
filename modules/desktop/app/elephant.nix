{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.elephant.nixosModules.default
  ];
  hm = {
    imports = [
      inputs.elephant.homeManagerModules.default
    ];
    programs.elephant = {
      enable = true;
      autoStart = true;
      debug = false;

      # Select specific providers
      providers = [
        "files"
        "desktopapplications"
        "calc"
        "runner"
        "clipboard"
        "symbols"
        "websearch"
        "menus"
        "providerlist"
      ];

      # Custom elephant configuration
      config = {
        providers = {
          files = {
            min_score = 50;
            icon = "folder";
          };
          desktopapplications = {
            launch_prefix = "uwsm app --";
            min_score = 60;
          };
          calc = {
            icon = "accessories-calculator";
          };
        };
      };
    };
  };
  services.elephant = {
    enable = true;
  };
}
