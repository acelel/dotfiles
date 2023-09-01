require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip').setup()
require('mason').setup()
require('mason-lspconfig').setup{
  ensure_installed = {
    'tsserver',
    'angularls',
    'html',
    'rust_analyzer',
  },
}

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
    })
  end,
})
