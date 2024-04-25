local wk = require('which-key')
local telescope_builtin = require('telescope.builtin')
local todo = require('todo-comments')

wk.setup()

vim.o.timeout = true
vim.o.timeoutlen = 300

wk.register({
	b = {
		name = 'Buffers',
		l = { telescope_builtin.buffers, 'Buffer List' },
	},
	d = {
		name = 'Diagnostics',
		N = { vim.diagnostic.goto_prev, 'Diagnostic previous' },
		l = { telescope_builtin.diagnostics, 'Diagnostics List' },
		n = { vim.diagnostic.goto_next, 'Diagnostic Next' },
	},
	e = {
		name = 'Explore',
		e = { vim.cmd.Explore, 'Explore' },
		h = { vim.cmd.Hexplore, 'Explore Horizontal' },
		v = { vim.cmd.Vexplore, 'Explore Vertical' },
	},
	g = {
		name = 'Git',
		b = { ':Git blame<CR>', 'Git Blame' },
		d = { ':Gdiffsplit HEAD^<CR>', 'Git Diff' },
		s = { telescope_builtin.git_status, 'Git Status' },
	},
	l = { '<cmd>set invlist<CR>', 'toggle hidden characters' },
	l = {
		name = 'LSP',
		d = { telescope_builtin.lsp_definitions, 'LSP Definitions' },
		i = { telescope_builtin.lsp_implementations, 'LSP Implementations' },
		r = { telescope_builtin.lsp_references, 'LSP References' },
	},
	p = {
		name = 'Project',
		f = { telescope_builtin.find_files, 'Project Find files' },
		g = { telescope_builtin.live_grep, 'Project Grep' },
		t = { '<cmd>Neotree<CR>', 'NeoTree' },
	},
	td = {
		name = 'ToDo',
		N = { todo.jump_prev, 'ToDo previous' },
		l = { '<cmd>TodoTelescope<CR>', 'ToDo List' },
		n = { todo.jump_next, 'ToDo Next' },
	},
	u = { '<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>', 'Undo toggle' },
}, {
	prefix = '<leader>',
	mode = 'n',
})

