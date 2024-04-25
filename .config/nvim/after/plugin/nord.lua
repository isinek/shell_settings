local nord = require('nord')

local status, _ = pcall(vim.cmd, 'colorscheme nord')
if not status then
	print('Colorscheme not found!')
	return
end

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_cursorline_transparent = true
vim.g.nord_enable_sidebar_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

-- Load the colorscheme
nord.set()

