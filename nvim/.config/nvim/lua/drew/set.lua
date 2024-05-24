local opt = vim.opt

-- Make line numbers default
opt.number = true
opt.relativenumber = true

-- Enable mouse mode
opt.mouse = "a"

-- Don't show the mode, since it's already in status line
opt.showmode = false

opt.breakindent = true
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"
opt.smartindent = true

opt.updatetime = 250
opt.timeoutlen = 300

-- Preview substitutions live
opt.inccommand = "split"

opt.cursorline = true
opt.scrolloff = 10
opt.hlsearch = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.splitbelow = true
opt.splitright = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
