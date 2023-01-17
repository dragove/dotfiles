local wezterm = require("wezterm")
return {
    -- color_scheme = "OneHalfDark",
    font = wezterm.font("FiraCode Nerd Font"),
    font_size = 18,
    hide_tab_bar_if_only_one_tab = true,
    -- window_background_opacity = 0.9,
    window_padding = {
        left = 4,
        right = 4,
        top = 4,
        bottom = 4,
    },
    -- modified colors from OneHalfDark
    colors = {
        foreground = '#dcdfe4',
        background = '#282c34',

        cursor_bg = '#51afef',
        cursor_fg = 'black',
        cursor_border = '#a3b3cc',

        selection_fg = '#dcdfe4',
        selection_bg = '#474e5d',

        ansi = {
            '#282c34',
            '#e06c75',
            '#98c379',
            '#e5c07b',
            '#61afef',
            '#c678dd',
            '#56b6c2',
            '#dcdfe4',
        },
        brights = {
            '#595e68',
            '#e06c75',
            '#98c379',
            '#e5c07b',
            '#61afef',
            '#c678dd',
            '#56b6c2',
            '#dcdfe4',
        },
    },
}
