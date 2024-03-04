local wezterm = require("wezterm")
return {
    front_end = "WebGpu",
    -- color_scheme = "OneHalfDark",
    font = wezterm.font("FiraCode Nerd Font"),
    font_size = 20,
    hide_tab_bar_if_only_one_tab = true,
    -- window_background_opacity = 0.9,
    window_padding = {
        left = 4,
        right = 4,
        top = 4,
        bottom = 4,
    },
    color_scheme = "Catppuccin Frappe",
}
