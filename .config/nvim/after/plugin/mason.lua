local mason = require('mason')
local masonLsp = require('mason-lspconfig')

mason.setup({
	ensure_installed = {
		'bashls',
		'clang-format',
		'clangd',
		'gitlint',
		'marksman',
		'pylsp'
	}
})

masonLsp.setup()

