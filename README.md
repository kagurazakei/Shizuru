# 💜 Shizuru - NixOS Configuration

<p align="center">
  <img src="./.github/assets/logo/flake.png" width="100px" alt="Shizuru Logo"/>
  <h1 align="center">Shizuru</h1>
  <p align="center">Aesthetic, Modular NixOS Configuration</p>
  <img src="./.github/assets/pallet/macchiato.png" width="600px" alt="Color Palette"/>
</p>

<div align="center">

[![Stars](https://img.shields.io/github/stars/maotsugiri/Shizuru?color=A5ADCB&labelColor=1E1E2E&style=for-the-badge&logo=starship&logoColor=c6a0f6)](https://github.com/maotsugiri/Shizuru/stargazers)
[![Repo Size](https://img.shields.io/github/repo-size/maotsugiri/Shizuru?color=A5ADCB&labelColor=1E1E2E&style=for-the-badge&logo=github&logoColor=C6A0F6)](https://github.com/maotsugiri/Shizuru)
[![NixOS](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=1E1E2E&logo=NixOS&logoColor=C6A0F6&color=A5ADCB)](https://nixos.org)
[![License](https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=1E1E2E&colorB=A5ADCB&logo=unlicense&logoColor=C6A0F6)](LICENSE)

</div>

---

## 🌟 Preview

### Hyprland Screenshots
> Quickshell config inspired by [caelestia-dots/shell](https://github.com/caelestia-dots/shell)

<div align="center">
  <img src="./.github/assets/screenshots/hypr-1.png" width="30%" alt="Hyprland 1"/>
  <img src="./.github/assets/screenshots/hypr-2.png" width="30%" alt="Hyprland 2"/>
  <img src="./.github/assets/screenshots/hypr-3.png" width="30%" alt="Hyprland 3"/>
  <img src="./.github/assets/screenshots/hypr-4.png" width="30%" alt="Hyprland 4"/>
  <img src="./.github/assets/screenshots/hypr-5.png" width="30%" alt="Hyprland 5"/>
  <img src="./.github/assets/screenshots/sddm.png" width="30%" alt="SDDM"/>
</div>
<p align="center"><em>Screenshots last updated: 2025-04-29</em></p>

### Niri Screenshots
<div align="center">
  <img src="./.github/assets/screenshots/niri-1.png" width="30%" alt="Niri 1"/>
  <img src="./.github/assets/screenshots/niri-2.png" width="30%" alt="Niri 2"/>
  <img src="./.github/assets/screenshots/niri-3.png" width="30%" alt="Niri 3"/>
  <img src="./.github/assets/screenshots/niri-4.png" width="30%" alt="Niri 4"/>
  <img src="./.github/assets/screenshots/niri-5.png" width="30%" alt="Niri 5"/>
  <img src="./.github/assets/screenshots/quickshell-lock.png" width="30%" alt="Quickshell Lock"/>
</div>
<p align="center"><em>Screenshots last updated: 2025-06-23</em></p>

---

## ✨ Features

### Core
- ❄️ **Flakes** – Declarative and reproducible system
- 🏡 **hjem + hjem-rum** – Modular home config system
- 💽 **home-manager** – Legacy support during transition

### Desktop Environment
- 🏠 **Niri** – Primary Wayland compositor
- ⚠️ **Hyprland** – Secondary Wayland compositor
- 📊 **QuickShell** – System panel and desktop UI

### Applications
- 🚀 **Walker** – Application launcher
- 📝 **VSCodium & NvChad** – Code editors
- 🐟 **Fish + Starship** – Shell environment
- 🖥️ **WezTerm + Kitty** – Terminal emulators

---

## 🗂️ Project Structure

```text
.
├── flake.nix            # Main flake configuration
├── hosts/               # Per-host configurations
│   ├── default/        # Default desktop configuration
│   └── shizuru/        # Shizuru host configuration
│       ├── config.nix  # Kernel, packages, SCX
│       ├── hardware.nix # Hardware profile
│       ├── user.nix    # Shell & user packages
│       ├── variables.nix # Git info, env vars
│       ├── hjem.nix    # hjem module
│       ├── home.nix    # home-manager overlay
│       └── theme.nix   # Theming config
└── modules/            # Reusable Nix modules
    ├── system/        # System-wide modules
    │   ├── common/    # Bootloader, Plymouth
    │   ├── desktop/   # Display and WM configs
    │   ├── options/   # Desktop/laptop options
    │   └── share/     # Shared modules
    └── home-manager/ # Home-manager modules
        ├── ags/      # AGS configurations
        ├── hana/     # Hana configurations
        ├── fabric/   # Fabric configurations
        ├── media/   # Media configurations
        ├── niri/    # Niri configurations
        ├── ui/      # UI configurations
        ├── zellij/  # Zellij configurations
        └── editors/ # Editor configurations
```
--- 

## 🛠️ Components

| Category            | Components                                                                 |
|---------------------|----------------------------------------------------------------------------|
| **Window Manager**  | [Niri](https://github.com/YaLTeR/niri), [Hyprland](https://hyprland.org)   |
| **Shell**          | Fish + [Atuin](https://github.com/ellie/atuin) + [Starship](https://starship.rs) |
| **Terminal**       | WezTerm, Kitty                                                            |
| **Editor**         | [VSCodium](https://vscodium.com), [NvChad](https://nvchad.com) via [nix4nvchad](https://github.com/nix-community/nix4nvchad) |
| **UI Components**  | [AGS](https://github.com/Aylur/ags), [HyprPanel](https://github.com/hyprwm/hyprpanel), QuickShell |
| **Utilities**      | [yazi](https://github.com/sxyazi/yazi), [grimblast](https://github.com/hyprwm/contrib), [wl-clip-persist](https://github.com/brunelli/wl-clip-persist) |
| **System**         | [CachyOS kernel](https://github.com/CachyOS/linux-cachyos), NetworkManager |

---

## � Theming

- **Color Scheme**: Catppuccin Mocha & Dark
- **Fonts**: JetBrains Mono, LigaMono Nerd Font
- **Icons**: [Papirus-Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- **Cursor**: Chiharu

---

## 🙏 Acknowledgments

This configuration draws inspiration from many amazing NixOS users:

- [Frost-Phoenix/nixos-config](https://github.com/Frost-Phoenix/nixos-config)
- [nomadics9/NixOS-Flake](https://github.com/nomadics9/NixOS-Flake)
- [samiulbasirfahim/Flakes](https://github.com/samiulbasirfahim/Flakes)
- [justinlime/dotfiles](https://github.com/justinlime/dotfiles)
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)
- [hjem](https://github.com/feel-co/hjem) & [hjem-rum](https://github.com/snugnug/hjem-rum) for home config

Special thanks to the NixOS community for their incredible work!

---

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg" alt="Catppuccin Footer"/>
</p>

<div align="center">
  <a href="#-shizuru---nixos-configuration">↑ Back to Top ↑</a>
</div>
