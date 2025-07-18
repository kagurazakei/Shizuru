{
  description = "MaotseNyein NixOS-Hyprland";

  inputs = {
    # Core Nixpkgs sources
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    font-flake.url = "github:redyf/font-flake";
    agenix.url = "github:ryantm/agenix";
    walker.url = "github:abenz1267/walker";
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alejandra.url = "github:kamadorueda/alejandra/4.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
    # Fish shell
    fish-flake = {
      url = "github:kagurazakei/fish-flake";
    };
    # Personal packages and cursors
    shizuruPkgs.url = "github:kagurazakei/shizuruPkgs";
    kureiji-ollie-cursor.url = "github:kagurazakei/kureiji-ollie-cursors";
    waifu-cursors.url = "git+https://codeberg.org/maotseantonio/waifu-cursors";
    caelestia = {
      url = "github:kagurazakei/shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
    };
    app2unit = {
      url = "github:soramanew/app2unit";
    };
    izlix = {
      type = "github";
      owner = "isabelroses";
      repo = "izlix";

      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    # Modules and utilities
    # lix-module = {
    #   url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.2-1.tar.gz";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    flake-programs-sqlite = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-anywhere = {
      url = "github:numtide/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.disko.follows = "disko";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nvchad4nix = {
      url = "github:MOIS3Y/nvchad4nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen = {
      url = "github:/InioX/Matugen";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #walker.url = "github:abenz1267/walker";
    yazi.url = "github:sxyazi/yazi";

    # Hyprland ecosystem
    hyprland.url = "github:hyprwm/Hyprland";
    hypridle.url = "github:hyprwm/hypridle";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprland-qt-support.url = "github:hyprwm/hyprland-qt-support";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprscroller = {
      url = "github:cpiber/hyprscroller";
      inputs.hyprland.follows = "hyprland";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agsv1 = {
      url = "github:dtomvan/agsv1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lunarsLib = {
      url = "github:lunarnovaa/lunarslib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hjem.follows = "hjem";
    };

    # Themes, overlays, fonts
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    nvchad-on-steroids = {
      url = "github:kagurazakei/nvchad-on-steroids";
      flake = false;
    };

    wayland-pipewire-idle-inhibit = {
      url = "git+https://codeberg.org/maotseantonio/wayland-pipewire-idle-inhibit";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty.url = "github:ghostty-org/ghostty";
    nixcord.url = "github:kaylorben/nixcord";
    textfox.url = "github:adriankarlen/textfox";
    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    swww = {
      url = "github:LGFae/swww/v0.10.3";
    };

    sddm-stray.url = "git+https://codeberg.org/maotseantonio/sddm-stray-flakes";
    nix-alien.url = "github:thiagokokada/nix-alien";
    wezterm.url = "github:wezterm/wezterm?dir=nix";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nyxexprs.url = "github:notashelf/nyxexprs";
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-master,
    nixpkgs-stable,
    home-manager,
    chaotic,
    agenix,
    # lix-module,
    quickshell,
    ...
  }: let
    system = "x86_64-linux";
    host = "shizuru";
    username = "antonio";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-master = import nixpkgs-master {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    # Development shell for quickshell QML development
    devShells.${system} = {
      quickshell = let
        qs = quickshell.packages.${system}.default.override {
          withJemalloc = true;
          withQtSvg = true;
          withWayland = true;
          withX11 = false;
          withPipewire = true;
          withPam = true;
          withHyprland = true;
          withI3 = false;
        };
        qtDeps = [
          qs
          pkgs.qt6.qtbase
          pkgs.qt6.qtdeclarative
        ];
      in
        pkgs.mkShell {
          name = "quickshell-dev";
          nativeBuildInputs = qtDeps;
          shellHook = let
            qmlPath = pkgs.lib.makeSearchPath "lib/qt-6/qml" qtDeps;
          in ''
            export QML2_IMPORT_PATH="$QML2_IMPORT_PATH:${qmlPath}"
          '';
        };
    };

    # NixOS configuration for host 'shizuru'
    nixosConfigurations = {
      shizuru = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system inputs username host chaotic pkgs-master;
        };
        modules = [
          ./hosts/${host}/config.nix
          inputs.chaotic.nixosModules.default
          home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
          inputs.catppuccin.nixosModules.catppuccin
          inputs.nixos-hardware.nixosModules.huawei-machc-wa
          inputs.nvf.nixosModules.default
          # lix-module.nixosModules.default
          agenix.nixosModules.default
          inputs.flake-programs-sqlite.nixosModules.programs-sqlite
          {
            nixpkgs.overlays = import ./overlays {
              inherit inputs system;
            };
          }
        ];
      };
    };
    nixConfig = {
      extra-substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org" # Keep this last
        "https://nyx.chaotic.cx"
        "https://hyprland.cachix.org"
        "https://yazi.cachix.org"
        "https://walker-git.cachix.org"
        "https://walker.cachix.org"
        "https://catppuccin.cachix.org" # a cache for all catppuccin ports
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
        "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
        "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
        "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
      ];
    };
  };
}
