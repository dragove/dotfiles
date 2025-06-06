local wezterm = require("wezterm")
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)
return {
  max_fps = 120,
  animation_fps = 1,
  use_dead_keys = false,
  check_for_updates = false,
  audible_bell = "Disabled",
  font = wezterm.font("Maple Mono NF CN", { weight = 'Medium' }),
  font_size = 14,
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
    left = 4,
    right = 4,
    top = 4,
    bottom = 4,
  },
  use_fancy_tab_bar = false,
  window_frame = {
    inactive_titlebar_bg = "#303446",
    active_titlebar_bg = "#303446",
  },
  colors = {
    tab_bar = {
      -- The color of the inactive tab bar edge/divider
      background = "#303446",
      active_tab = {
        bg_color = "#303446",
        fg_color = "#f0f0f0",
      },
      inactive_tab = {
        bg_color = "#303446",
        fg_color = "#999999",
      },
    },
  },
  show_new_tab_button_in_tab_bar = false,
  color_scheme = "Catppuccin Frappe",
  -- for windows
  -- default_prog = { "nu.exe" },
}
