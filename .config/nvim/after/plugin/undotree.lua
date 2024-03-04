local wk = require('which-key')

wk.register({
	u = { '<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>', 'Undo toggle' }
}, {
	prefix = '<leader>',
	mode = 'n'
})

