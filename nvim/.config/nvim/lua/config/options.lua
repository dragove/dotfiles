local opt, g = vim.opt, vim.g

g.mapleader = ' '

g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrwPlugin = 1

opt.undofile = true
opt.writebackup = false
opt.swapfile = false
opt.cmdheight = 0
opt.cursorline = true
opt.laststatus = 3
opt.relativenumber = true
opt.ruler = false
opt.showmode = false
opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.winblend = 0
opt.wrap = false
opt.list = true
opt.listchars = 'tab:» ,nbsp:+,trail:·,extends:→,precedes:←,'

opt.scrolloff = 3
opt.autoindent = true
opt.expandtab = true
opt.incsearch = true
opt.infercase = true
opt.shiftwidth = 4
opt.smartcase = true
opt.smartindent = true
opt.tabstop = 4
opt.virtualedit = 'block'
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldlevelstart = 5

opt.completeopt = 'menuone,noselect,noinsert,popup'
