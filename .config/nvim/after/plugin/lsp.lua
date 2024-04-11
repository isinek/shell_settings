local lspzero = require('lsp-zero').preset({'recomended'})
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- clangd settings
lspconfig.clangd.setup({})

-- Emmet settings
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				['bem.enabled'] = true,
			},
		},
	}
})

-- OmniSharp settings
lspconfig.omnisharp.setup({
	capabilities = capabilities,
	cmd = {	'omnisharp', '--languageserver' , '--hostPID', tostring(vim.fn.getpid()) }
})

-- lspzero-zero
lspzero.on_attach(function(client, bufnr)
	lspzero.default_keymaps({buffer = bufnr})
end)

lspzero.set_sign_icons({
	error = '✘',
	warn = '',
	hint = '',
	info = '',
})

lspzero.setup_servers({
	'clangd',
	'omnisharp'
})

lspzero.setup()

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = 'minimal',
		border = 'single',
		source = 'always',
		header = 'Diagnostic',
		prefix = '',
	},
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

