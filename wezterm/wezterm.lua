local wezterm = require 'wezterm'

return {
  font = wezterm.font("Maple Mono NF"),
  font_size = 15.0,

  color_scheme = "Catppuccin Mocha",

  window_background_opacity = 0.8,
  macos_window_background_blur = 20,

  window_padding = {
    left = '2cell',
    right = '2cell',
    top = '0.5cell',
    bottom = '0.5cell',
  },

  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,
  tab_bar_at_bottom = true,

  send_composed_key_when_left_alt_is_pressed = true,

  default_prog = { "/bin/zsh", "-lc", "tmux attach || tmux" },
}

