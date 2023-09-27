local mason = require("mason")
local masonLsp = require("mason-lspconfig")

mason.setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"marksman",
		"pylsp"
	}
})

masonLsp.setup()

