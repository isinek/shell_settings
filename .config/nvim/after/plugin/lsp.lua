local lspzero = require('lsp-zero').preset({'recomended'})
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- clangd settings
lspconfig.clangd.setup({})

-- Emmet settings
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
       ["bem.enabled"] = true,
     },
    },
  }
})

-- lspzero-zero
lspzero.on_attach(function(client, bufnr)
  lspzero.default_keymaps({buffer = bufnr})
end)

lspzero.setup_servers({
  'tsserver',
  'clangd',
  'rust_analyzer'
})

lspzero.setup()


vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

