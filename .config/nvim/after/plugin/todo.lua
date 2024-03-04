local todo = require('todo-comments')
local wk = require('which-key')

todo.setup()

wk.register({
	td = {
		name = 'ToDo',
		l = { '<cmd>TodoTelescope<CR>', 'ToDo List' },
		n = { todo.jump_next, 'ToDo Next' },
		N = { todo.jump_prev, 'ToDo previous' }
	}
}, {
	prefix = '<leader>',
	mode = 'n'
})

