local servers = {
	"jsonls",
  "yamlls",
  "ansiblels",
  "terraformls",
  "dockerls",
	"pyright",
	"lua_ls",
  "jdtls", -- java
  "gradle_ls",
  "tsserver",
  "bashls",
  "gopls",
}

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = servers
})

local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.tbl_extend is used to extend the bufopts table with a desc key for each mapping.
  -- The "keep" argument ensures that the original bufopts table is not modified and that the desc key is added uniquely for each mapping.
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend("keep", bufopts, { desc = "LSP - [g]o to [d]eclaration"}))
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend("keep", bufopts, { desc = "LSP - [g]o to [d]definition"}))
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, vim.tbl_extend("keep", bufopts, { desc = "LSP - [g]o to [r]eferences"}))
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend("keep", bufopts, { desc = "LSP - [g]o to [i]mplementation"}))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend("keep", bufopts, { desc = "LSP - open hover information"}))
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, vim.tbl_extend("keep", bufopts, { desc = "LSP - open diagnostics in a floating window"}))
  vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, vim.tbl_extend("keep", bufopts, { desc = "LSP - [g]o to previous diagnostic message"}))
  vim.keymap.set("n", "g]", vim.diagnostic.goto_next, vim.tbl_extend("keep", bufopts, { desc = "LSP - [g]o to next diagnostic message"}))

end

vim.fn.sign_define('DiagnosticSignError', { texthl = 'DiagnosticSignError', text = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn', { texthl = 'DiagnosticSignWarn', text = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignHint', { texthl = 'DiagnosticSignHint', text = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo', { texthl = 'DiagnosticSignInfo', text = '', numhl = '' })

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}


local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Needed for UFO
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

for _, server in pairs(servers) do
	opts = {
		on_attach = on_attach,
		capabilities = capabilities
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.plugin_configs.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
