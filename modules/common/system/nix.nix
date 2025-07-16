{
  pkgs,
  inputs,
  config,
  username,
  ...
}: {
  age.secrets = {
    github-token = {
      file = ../../../secrets/github-token.age;
      owner = config.users.users.${username}.name;
      group = config.users.users.${username}.group; # Dynamic reference to your group
      mode = "600";
    };
  };
  nix = {
    package = pkgs.master. nixVersions.git;
    extraOptions = ''
      access-tokens = github.com=file:${config.age.secrets.github-token.path}
    '';
    channel.enable = false;
    settings = {
      # separateDebugInfo = true;
      nix-path = [
        "nixpkgs=${inputs.nixpkgs.outPath}"
        "nixpkgs-master=${inputs.nixpkgs-master.outPath}"
        "nixpkgs-stable=${inputs.nixpkgs-stable.outPath}"
      ];
      allowed-users = ["root" "@wheel" "antonio"];
      trusted-users = ["root" "@wheel" "antonio" "@builders"];
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
