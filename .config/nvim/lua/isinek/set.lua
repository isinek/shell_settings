local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.expandtab = false
opt.list = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true

opt.termguicolors = true
opt.signcolumn = 'yes'

opt.scrolloff = 8
opt.isfname:append('@-@')

opt.updatetime = 50

opt.colorcolumn = '80,120'

opt.backspace = 'indent,eol,start'

opt.mouse = ''
opt.mousemodel = ''

vim.g.mapleader = ' '

