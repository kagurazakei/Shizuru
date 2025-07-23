{wezterm}: ''
  local wezterm = require("wezterm")
  local M = {}

  local colors = {
    latte = {
      rosewater = "#dc8a78", flamingo = "#dd7878", pink = "#ea76cb", mauve = "#8839ef",
      red = "#d20f39", maroon = "#e64553", peach = "#fe640b", yellow = "#df8e1d",
      green = "#40a02b", teal = "#179299", sky = "#04a5e5", sapphire = "#209fb5",
      blue = "#1e66f5", lavender = "#7287fd", text = "#4c4f69", subtext1 = "#5c5f77",
      subtext0 = "#6c6f85", overlay2 = "#7c7f93", overlay1 = "#8c8fa1", overlay0 = "#9ca0b0",
      surface2 = "#acb0be", surface1 = "#bcc0cc", surface0 = "#ccd0da", crust = "#dce0e8",
      mantle = "#e6e9ef", base = "#eff1f5"
    },
    frappe = {
      rosewater = "#f8bd96", flamingo = "#ff9e64", pink = "#ff79c6", mauve = "#bd93f9",
      red = "#ff5555", maroon = "#ffb86c", peach = "#ffb347", yellow = "#f1fa8c",
      green = "#50fa7b", teal = "#5af78e", sky = "#8be9fd", sapphire = "#66d9ef",
      blue = "#89b4fa", lavender = "#cba6f7", text = "#f8f8f2", subtext1 = "#e2e2dc",
      subtext0 = "#cdd6f4", overlay2 = "#6272a4", overlay1 = "#a0a8c0", overlay0 = "#707880",
      surface2 = "#3b3b4d", surface1 = "#2a2a3a", surface0 = "#1e1e2e", base = "#0a0a13",
      mantle = "#070710", crust = "#04040a"
    },
    macchiato = {
      rosewater = "#f4dbd6", flamingo = "#f0c6c6", pink = "#f5bde6", mauve = "#c6a0f6",
      red = "#ed8796", maroon = "#ee99a0", peach = "#f5a97f", yellow = "#eed49f",
      green = "#a6da95", teal = "#8bd5ca", sky = "#91d7e3", sapphire = "#7dc4e4",
      blue = "#8aadf4", lavender = "#b7bdf8", text = "#cad3f5", subtext1 = "#b8c0e0",
      subtext0 = "#a5adcb", overlay2 = "#939ab7", overlay1 = "#8087a2", overlay0 = "#6e738d",
      surface2 = "#5b6078", surface1 = "#494d64", surface0 = "#363a4f", base = "#24273a",
      mantle = "#1e2030", crust = "#181926"
    },
    mocha = {
      rosewater = "#f8bd96", flamingo = "#ff9e64", pink = "#ff79c6", mauve = "#bd93f9",
      red = "#ff5555", maroon = "#ffb86c", peach = "#ffb347", yellow = "#f1fa8c",
      green = "#50fa7b", teal = "#5af78e", sky = "#8be9fd", sapphire = "#66d9ef",
      blue = "#89b4fa", lavender = "#cba6f7", text = "#f8f8f2", subtext1 = "#e2e2dc",
      subtext0 = "#cdd6f4", overlay2 = "#6272a4", overlay1 = "#a0a8c0", overlay0 = "#707880",
      surface2 = "#3b3b4d", surface1 = "#2a2a3a", surface0 = "#1e1e2e", base = "#0a0a13",
      mantle = "#070710", crust = "#04040a"
    },
    espresso = {
      rosewater = "#ece3e1", flamingo = "#e1d2d2", pink = "#ddccd8", mauve = "#bbb2c9",
      red = "#c4a2aa", maroon = "#cbadb1", peach = "#d5beb4", yellow = "#ece3d3",
      green = "#b9ddb6", teal = "#badad4", sky = "#b8d4db", sapphire = "#a9c0ce",
      blue = "#aab3c7", lavender = "#bfc1d2", text = "#d3d6e1", subtext1 = "#bec2d2",
      subtext0 = "#a8adc3", overlay2 = "#9299b4", overlay1 = "#7c84a5", overlay0 = "#686f94",
      surface2 = "#555a7b", surface1 = "#434664", surface0 = "#30314b", base = "#101010",
      mantle = "#090909", crust = "#080808"
    },
    evergarden = {
      rosewater = "#E3A8D1", flamingo = "#E3A8D1", pink = "#E3A8D1", mauve = "#D6A0D1",
      red = "#E67E80", maroon = "#E67E80", peach = "#E69875", yellow = "#DBBC7F",
      green = "#B2C98F", teal = "#93C9A1", sky = "#97C9C3", sapphire = "#9BB5CF",
      blue = "#9BB5CF", lavender = "#D6A0D1", text = "#D9E4DC", subtext1 = "#C9D6D0",
      subtext0 = "#AEC2BE", overlay2 = "#99ADAD", overlay1 = "#6E8585", overlay0 = "#5E6C70",
      surface2 = "#46545B", surface1 = "#3D494F", surface0 = "#343E44", base = "#252B2E",
      mantle = "#1C2225", crust = "#171C1F"
    }
  }

  local mappings = {
    evergarden = "Catppuccin Evergarden",
    espresso = "Catppuccin Espresso",
    mocha = "Catppuccin Mocha",
    macchiato = "Catppuccin Macchiato",
    frappe = "Catppuccin Frappe",
    latte = "Catppuccin Latte"
  }

  function M.select(palette, flavor, accent)
    local c = palette[flavor]
    local isLatte = palette == "latte"

    return {
      foreground = c.text,
      background = c.base,
      cursor_fg = isLatte and c.base or c.crust,
      cursor_bg = c.rosewater,
      cursor_border = c.rosewater,
      selection_fg = c.text,
      selection_bg = c.surface2,
      scrollbar_thumb = c.surface2,
      split = c.overlay0,
      ansi = {
        isLatte and c.subtext1 or c.surface1,
        c.red, c.green, c.yellow,
        c.blue, c.pink, c.teal,
        isLatte and c.surface2 or c.subtext1
      },
      brights = {
        isLatte and c.subtext0 or c.surface2,
        c.red, c.green, c.yellow,
        c.blue, c.pink, c.teal,
        isLatte and c.surface1 or c.subtext0
      },
      indexed = { [16] = c.peach, [17] = c.rosewater },
      compose_cursor = c.flamingo,
      tab_bar = {
        background = c.crust,
        active_tab = { bg_color = c[accent], fg_color = c.crust },
        inactive_tab = { bg_color = c.mantle, fg_color = c.text },
        inactive_tab_hover = { bg_color = c.base, fg_color = c.text },
        new_tab = { bg_color = c.surface0, fg_color = c.text },
        new_tab_hover = { bg_color = c.surface1, fg_color = c.text },
        inactive_tab_edge = c.surface0
      },
      visual_bell = c.surface0
    }
  end

  local function select_for_appearance(appearance, options)
    return appearance:find("Dark") and options.dark or options.light
  end

  local function tableMerge(t1, t2)
    for k, v in pairs(t2) do
      if type(v) == "table" then
        t1[k] = type(t1[k]) == "table" and tableMerge(t1[k], v) or v
      else
        t1[k] = v
      end
    end
    return t1
  end

  function M.apply_to_config(c, opts)
    opts = opts or {}
    local defaults = {
      flavor = "mocha",
      accent = "mauve",
      sync = true,
      sync_flavors = { light = "latte", dark = "mocha" },
      color_overrides = {
        evergarden = {}, espresso = {}, mocha = {},
        macchiato = {}, frappe = {}, latte = {}
      },
      token_overrides = {
        evergarden = {}, espresso = {}, mocha = {},
        macchiato = {}, frappe = {}, latte = {}
      }
    }

    local o = tableMerge(defaults, opts)
    local palette = tableMerge(colors, o.color_overrides)
    local color_schemes = {}

    for flavor, name in pairs(mappings) do
      color_schemes[name] = tableMerge(
        M.select(palette, flavor, o.accent),
        o.token_overrides[flavor]
      )
    end

    c.color_schemes = tableMerge(c.color_schemes or {}, color_schemes)

    if o.sync then
      local appearance = wezterm.gui.get_appearance()
      c.color_scheme = select_for_appearance(appearance, {
        dark = mappings[o.sync_flavors.dark],
        light = mappings[o.sync_flavors.light]
      })
      c.command_palette_bg_color = select_for_appearance(appearance, {
        dark = colors[o.sync_flavors.dark].crust,
        light = colors[o.sync_flavors.light].crust
      })
      c.command_palette_fg_color = select_for_appearance(appearance, {
        dark = colors[o.sync_flavors.dark].text,
        light = colors[o.sync_flavors.light].text
      })
    else
      c.color_scheme = mappings[o.flavor]
      c.command_palette_bg_color = colors[o.flavor].crust
      c.command_palette_fg_color = colors[o.flavor].text
    end

    c.window_frame = tableMerge(c.window_frame or {}, {
      active_titlebar_bg = colors[o.flavor].crust,
      active_titlebar_fg = colors[o.flavor].text,
      inactive_titlebar_bg = colors[o.flavor].crust,
      inactive_titlebar_fg = colors[o.flavor].text,
      button_fg = colors[o.flavor].text,
      button_bg = colors[o.flavor].base
    })
  end

  return M
''
