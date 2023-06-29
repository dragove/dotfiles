return {
    "rebelot/heirline.nvim",
    config = function()
        local viMode = {
            init = function(self)
                self.mode = vim.fn.mode(1)
            end,
            static = {
                mode_names = { -- change the strings if you like it vvvvverbose!
                    n = " N",
                    no = " N?",
                    nov = " N?",
                    noV = " N?",
                    ["no\22"] = " N?",
                    niI = " Ni",
                    niR = " Nr",
                    niV = " Nv",
                    nt = " Nt",
                    v = "󰉸 V",
                    vs = "󰉸 Vs",
                    V = "󰉸 V_",
                    Vs = "󰉸 Vs",
                    ["\22"] = "󰉸 ^V",
                    ["\22s"] = "󰉸 ^V",
                    s = "󰛔 S",
                    S = "󰛔 S_",
                    ["\19"] = "󰛔 ^S",
                    i = " I",
                    ic = " Ic",
                    ix = " Ix",
                    R = " R",
                    Rc = " Rc",
                    Rx = " Rx",
                    Rv = " Rv",
                    Rvc = " Rv",
                    Rvx = " Rv",
                    c = " C",
                    cv = " Ex",
                    r = "...",
                    rm = "M",
                    ["r?"] = "?",
                    ["!"] = "!",
                    t = " T",
                },
                mode_colors = {
                    n = "red",
                    i = "green",
                    v = "cyan",
                    V = "cyan",
                    ["\22"] = "cyan",
                    c = "orange",
                    s = "purple",
                    S = "purple",
                    ["\19"] = "purple",
                    R = "orange",
                    r = "orange",
                    ["!"] = "red",
                    t = "red",
                }
            },
            provider = function(self)
                return " %2(" .. self.mode_names[self.mode] .. "%)"
            end,
            hl = function(self)
                local mode = self.mode:sub(1, 1) -- get only the first mode character
                return { fg = self.mode_colors[mode], bold = true, }
            end,
            update = {
                "ModeChanged",
                pattern = "*:*",
                callback = vim.schedule_wrap(function()
                    vim.cmd("redrawstatus")
                end),
            },
        }

        local LSPProgress = {
            update = {
                "User",
                pattern = { "LspProgressStatusUpdated" },
                callback = vim.schedule_wrap(function()
                  vim.cmd.redrawstatus()
                end),
            },
            provider = require("lsp-progress").progress
        }

        require("lsp-progress").setup()
        require("heirline").setup({
            statusline = {
                viMode, { provider = "%=" },
                LSPProgress
            }
        })
    end,
    dependencies = {
        { "linrongbin16/lsp-progress.nvim" },
        { "nvim-tree/nvim-web-devicons" }
    }
}
