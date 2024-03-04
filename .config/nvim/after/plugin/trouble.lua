local trouble = require('trouble')
local keymap = vim.keymap
local wk = require('which-key')

trouble.setup({
	signs = {
		error = '✘',
		warning = '',
		hint = "",
		information = '',
		other = "",
	},
	use_diagnostic_signs = false
})

