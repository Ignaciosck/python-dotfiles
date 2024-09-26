local wezterm = require("wezterm")
local config = wezterm.config_builder()


config.font =

  wezterm.font('SauceCodePro Nerd Font')

config.font_size = 12



config.enable_tab_bar = true

config.window_decorations = "RESIZE"



config.window_background_opacity = 0.85



return config


