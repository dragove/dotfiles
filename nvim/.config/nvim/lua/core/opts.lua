-- code is stolen from https://github.com/echasnovski/nvim/blob/master/lua/ec/settings.lua
-- stylua: ignore start
-- Leader key =================================================================
vim.g.mapleader      = " "

-- General ====================================================================
vim.o.backup         = false    -- Don't store backup
vim.o.mouse          = 'a'      -- Enable mouse
vim.o.switchbuf      = 'usetab' -- Use already opened buffers when switching
vim.o.writebackup    = false    -- Don't store backup
vim.o.undofile       = true     -- Enable persistent undo
vim.o.swapfile       = false
vim.o.guifont        = 'FiraCode Nerd Font:h16'
vim.o.cmdheight      = 0

-- UI =========================================================================
vim.o.breakindent    = true     -- Indent wrapped lines to match line start
vim.o.cursorline     = true     -- Enable highlighting of the current line
vim.o.laststatus     = 3        -- show statusline in last window
vim.o.linebreak      = true     -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.list           = true     -- Show helpful character indicators
vim.o.relativenumber = true     -- Show relative line numbers
vim.o.pumblend       = 10       -- Make builtin completion menus slightly transparent
vim.o.pumheight      = 10       -- Make popup menu smaller
vim.o.ruler          = false    -- Don't show cursor position
vim.o.shortmess      = 'aoOWFc' -- Disable certain messages from |ins-completion-menu|
vim.o.showmode       = false    -- Don't show mode in command line
vim.o.signcolumn     = 'yes'    -- Always show signcolumn or it would frequently shift
vim.o.splitbelow     = true     -- Horizontal splits will be below
vim.o.splitright     = true     -- Vertical splits will be to the right
vim.o.termguicolors  = true     -- Enable gui colors
vim.o.winblend       = 0        -- Make floating windows transparent
vim.o.wrap           = false    -- Display long lines as just one line

vim.o.fillchars      = table.concat(
    { 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣',
        'vertright:╠' },
    ','
)
vim.o.listchars      = table.concat(
    { 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' },
    ','
)

vim.opt.shortmess:append('C')  -- Don't show "Scanning..." messages
vim.o.splitkeep     = 'screen' -- Reduce scroll during window split

-- Editing ====================================================================
vim.o.autoindent    = true                                 -- Use auto indent
vim.o.expandtab     = true                                 -- Convert tabs to spaces
vim.o.formatoptions = 'rqnl1j'                             -- Improve comment editing
vim.o.ignorecase    = true                                 -- Ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch     = true                                 -- Show search results while typing
vim.o.infercase     = true                                 -- Infer letter cases for a richer built-in keyword completion
vim.o.shiftwidth    = 4                                    -- Use this number of spaces for indentation
vim.o.smartcase     = true                                 -- Don't ignore case when searching if pattern has upper case
vim.o.smartindent   = true                                 -- Make indenting smart
vim.o.tabstop       = 4                                    -- Insert 4 spaces for a tab
vim.o.virtualedit   = 'block'                              -- Allow going past the end of line in visual block mode

vim.opt.iskeyword:append('-')                              -- Treat dash separated words as a word text object

vim.o.completeopt            = 'menuone,noinsert,noselect' -- Customize completions

-- Define pattern for a start of 'numbered' list. This is responsible for
-- correct formatting of lists when using `gw`. This basically reads as 'at
-- least one special character (digit, -, +, *) possibly followed some
-- punctuation (. or `)`) followed by at least one space is a start of list
-- item'
vim.o.formatlistpat          = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- disable some pluggins shipped with neovim ==================================
vim.g.loaded_gzip            = 1
vim.g.loaded_tar             = 1
vim.g.loaded_tarPlugin       = 1
vim.g.loaded_zip             = 1
vim.g.loaded_zipPlugin       = 1
vim.g.loaded_getscript       = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball         = 1
vim.g.loaded_vimballPlugin   = 1
vim.g.loaded_matchit         = 1
vim.g.loaded_2html_plugin    = 1
vim.g.loaded_logiPat         = 1
vim.g.loaded_rrhelper        = 1
vim.g.loaded_netrw           = 1
vim.g.loaded_netrwPlugin     = 1

--stylua: ignore end
