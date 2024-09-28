local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'catppuccin-mocha'
config.font = wezterm.font 'Maple Mono NF'
config.font_size = 13
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.window_decorations = 'RESIZE'
config.window_padding = {
  left = '1cell',
  right = '2cell',
  top = '1.5cell',
  bottom = '0cell',
}

return config
