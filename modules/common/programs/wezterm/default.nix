{
  pkgs,
  inputs,
  ...
}: let
  wezterm = inputs.wezterm.packages.${pkgs.system}.default;
  utils = import ./utils.nix {inherit wezterm;};
  keybinds = import ./keybinds.nix {inherit wezterm utils;};
  catppuccin = import ./catppuccin.nix {inherit wezterm;};
  bar = import ./bar.nix {inherit wezterm;};
in {
  hj = {
    packages = [pkgs.wezterm];
    files = {
      ".config/wezterm/wezterm.lua".text = ''
        local utils = require("utils")
        local wezterm = require("wezterm")
        local c = {}
        if wezterm.c_builder then
        	c = wezterm.config_builder()
        end
        c.enable_wayland = true
        require("catppuccin").apply_to_config(c)
        require("bar").apply_to_config(c)
        require("keybinds").apply(c)
        c.window_background_opacity = 1.0
        c.window_background_image_hsb = { brightness = 0.045 }
        if utils.is_linux() or utils.is_darwin() then
        	c.default_prog = { "fish", "--login" }
        elseif utils.is_windows() then
        	c.default_prog = { "wsl.exe" }
        	c.default_domain = "WSL:NixOS"
        	c.launch_menu = {
        		{
        			label = "PowerShell",
        			args = { "pwsh.exe", "-NoLogo" },
        			domain = { DomainName = "local" },
        		},
        	}
        end
        if utils.is_linux() then
        	c.window_decorations = "TITLE | RESIZE"
        else
        	c.window_decorations = "RESIZE"
        end

        if utils.is_windows() then
        	c.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
        else
        	c.window_padding = { left = 10, right = 0, top = 0, bottom = 0 }
        end
        c.font = wezterm.font_with_fallback({
        	"JetBrainsMono Nerd Font",
        	"Symbols Nerd Font",
        })
        c.font_size = 14
        c.adjust_window_size_when_changing_font_size = false
        c.window_frame = {
        	font = wezterm.font("Maple Mono"),
        	font_size = c.font_size,
        }
        c.audible_bell = "Disabled"
        c.default_cursor_style = "BlinkingBar"
        c.window_close_confirmation = "NeverPrompt"
        if utils.is_windows() then
        	c.front_end = "OpenGL"
        else
        	c.front_end = "WebGpu"
        end
        c.check_for_updates = false
        return c
      '';
      ".config/wezterm/utils.lua".text = utils;
      ".config/wezterm/keybinds.lua".text = keybinds;
      ".config/wezterm/catppuccin.lua".text = catppuccin;
      ".config/wezterm/bar.lua".text = bar;
    };
  };
}
