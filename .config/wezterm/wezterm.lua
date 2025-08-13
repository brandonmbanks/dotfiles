-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local conf = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices

-- font
conf.font = wezterm.font({
  family = "CaskaydiaMono Nerd Font Mono",
  weight = "Regular",
})
conf.font_size = 15.0

-- hides application menu bar
conf.window_decorations = "RESIZE"
conf.window_background_opacity = 0.90
conf.macos_window_background_blur = 10

conf.keys = {
  {
    key = "w",
    mods = "CTRL|ALT",
    action = act.CloseCurrentPane({ confirm = true }),
  },
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "UpArrow",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "DownArrow",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Down"),
  },
}

local scheme = wezterm.get_builtin_color_schemes()["rose-pine-moon"]
scheme.selection_bg = "#5e5b73"

conf.color_scheme = "rose-pine-moon-hl"
conf.color_schemes = {
  ["rose-pine-moon-hl"] = scheme,
}

-- and finally, return the configuration to wezterm
return conf
