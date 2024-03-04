local keymap = vim.keymap
local wk = require('which-key')

wk.register({
	e = {
		name = 'Explore',
		e = { vim.cmd.Explore, 'Explore' },
		h = { vim.cmd.Hexplore, 'Explore Horizontal' },
		v = { vim.cmd.Vexplore, 'Explore Vertical' }
	},
	d = {
		name = 'Diagnostic',
		n = { vim.diagnostic.goto_next, 'Diagnostic Next' },
		N = { vim.diagnostic.goto_prev, 'Diagnostic previous' }
	},
	l = { '<cmd>set invlist<CR>', 'toggle hidden characters' },
	cw = { '<cmd>%s/[ \\t]\\+$//g<CR>', 'Clean Whitespaces' }
}, {
	prefix = '<leader>',
	mode = 'n'
})

keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set('n', '<leader>y', '"+y')
keymap.set('v', '<leader>y', '"+y')
keymap.set('n', '<leader>Y', '"+Y')

keymap.set('n', '<leader>r', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

