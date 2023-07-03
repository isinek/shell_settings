local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true

opt.termguicolors = true
opt.signcolumn = "yes"

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.isfname:append('@-@')

opt.updatetime = 50

opt.colorcolumn = '80,120'

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.mouse = ""
opt.mousemodel = ""

vim.g.mapleader = ' '

