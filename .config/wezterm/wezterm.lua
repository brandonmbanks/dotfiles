-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "rose-pine-moon"

-- font
config.font = wezterm.font({
  family = "CaskaydiaMono Nerd Font Mono",
  weight = "Regular",
})
config.font_size = 14.0

config.keys = {
  {
    key = "w",
    mods = "CTRL|ALT",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
}

-- and finally, return the configuration to wezterm
return config
