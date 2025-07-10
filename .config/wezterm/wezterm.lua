-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices

-- font
config.font = wezterm.font({
  family = "CaskaydiaMono Nerd Font Mono",
  weight = "Regular",
})
config.font_size = 15.0

config.keys = {
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

config.color_scheme = "rose-pine-moon-hl"
config.color_schemes = {
  ["rose-pine-moon-hl"] = scheme,
}

-- and finally, return the configuration to wezterm
return config
