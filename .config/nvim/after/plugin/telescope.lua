local telescope = require('telescope')
local builtin = require('telescope.builtin')
local wk = require('which-key')

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = 'smart_case'
		}
	}
})
telescope.load_extension('fzf');

wk.register({
	p = {
		name = 'Project',
		f = { builtin.find_files, 'Project Find files' },
		g = { builtin.live_grep, 'Project Grep' }
	},
	l = {
		name = 'LSP',
		r = { builtin.lsp_references, 'LSP References' },
		i = { builtin.lsp_implementations, 'LSP Implementations' },
		d = { builtin.lsp_definitions, 'LSP Definitions' },
	},
	b = {
		name = 'Buffers',
		l = { builtin.buffers, 'Buffer List' }
	},
	g = {
		name = 'Git',
		s = { builtin.git_status, 'Git Status' }
	},
	d = {
		name = 'Diagnostics',
		l = { builtin.diagnostics, 'Diagnostics List' }
	}
}, {
	prefix = '<leader>',
	mode = 'n'
})

