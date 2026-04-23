require('mason').setup()

-- Auto-install LSP servers from the single source of truth in lsp.lua.
-- mason-lspconfig bridges lspconfig names <-> Mason package names.
-- automatic_enable = false because lsp.lua already calls vim.lsp.enable() explicitly.
require('mason-lspconfig').setup({
  ensure_installed = require('config.lsp').servers,
  automatic_enable = false,
})

-- Auto-install formatters from conform's formatters_by_ft list.
require('mason-conform').setup()

-- Auto-install linters from nvim-lint's linters_by_ft list.
require('mason-nvim-lint').setup()
