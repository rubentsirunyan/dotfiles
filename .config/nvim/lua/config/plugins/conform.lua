require('conform').setup({
  formatters_by_ft = {
    lua        = { 'stylua' },
    python     = { 'ruff_format', 'ruff_organize_imports' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    yaml       = { 'yamlfmt' },
    terraform  = { 'terraform_fmt' },
    sh         = { 'shfmt' },
    bash       = { 'shfmt' },
    go         = { 'goimports', 'gofmt' },
  },
  formatters = {
    stylua = { prepend_args = { '--quote-style', 'ForceDouble' } },
    prettier = { prepend_args = { '--no-semi', '--single-quote', '--jsx-single-quote' } },
  },
})

vim.keymap.set({ 'n', 'v' }, '<leader>F', function()
  require('conform').format({ async = false, lsp_fallback = true })
end, { desc = 'Format buffer (conform + LSP fallback)' })
