local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'catppuccin-mocha'
config.font = wezterm.font 'Maple Mono NF'
config.font_size = 13

-- Tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.colors = { tab_bar =  {
  background = "rgb(0, 0, 0, 0)",
  active_tab = {
    bg_color = 'rgb(0, 0, 0, 0)',
    fg_color = '#94e2d5',
    intensity = 'Bold',
  },
  inactive_tab = {
    bg_color = 'rgb(0, 0, 0, 0)',
    fg_color = '#a6adc8'
  }
} }

-- Cursor
config.default_cursor_style = 'SteadyBar'
config.cursor_thickness = 3

config.window_decorations = 'RESIZE'
config.window_padding = {
  left = '1cell',
  right = '2cell',
  top = '1.5cell',
  bottom = '0cell',
}

-- Background
config.window_background_opacity = .8
-- stange redraw bug where i see a ghost of the past tab, when switching to a new one?
-- config.window_background_gradient = {
--   colors = {'#1e1e2e88', '#11111bee' },
--   -- Specifies a Linear gradient starting in the top left corner.
--   orientation = { Linear = { angle = -45.0 } },
-- }

return config
