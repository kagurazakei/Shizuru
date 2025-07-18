{...}: {
  chaotic.nyx.cache.enable = true;
  chaotic.nyx.overlay.enable = true;
  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org" # Keep this last
        "https://nyx.chaotic.cx"
        "https://hyprland.cachix.org"
        "https://yazi.cachix.org"
        "https://walker-git.cachix.org"
        "https://walker.cachix.org"
        "https://catppuccin.cachix.org" # a cache for all catppuccin ports
        "https://nix-community.cachix.org"
      ];
      trusted-substituters = [
        "https://cache.nixos.org" # Keep this last
        "https://nyx.chaotic.cx"
        "https://hyprland.cachix.org"
        "https://yazi.cachix.org"
        "https://walker-git.cachix.org"
        "https://walker.cachix.org"
        "https://catppuccin.cachix.org" # a cache for all catppuccin ports
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
        "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
        "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
        "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}
