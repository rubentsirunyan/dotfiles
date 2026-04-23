local M = {}

-- Servers enabled via native `vim.lsp.enable`. Per-server settings live in
-- `lsp/<name>.lua` at the runtimepath root; nvim-lspconfig ships defaults for
-- servers we don't customize, so empty stub files are unnecessary.
M.servers = {
  'ansiblels', 'bashls', 'dockerls', 'gopls', 'jdtls',
  'jsonls', 'lua_ls', 'pyright', 'terraformls', 'ts_ls', 'yamlls',
}

vim.lsp.enable(M.servers)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local map = function(m, lhs, rhs, desc)
      vim.keymap.set(m, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map('n', 'gD', vim.lsp.buf.declaration, 'LSP: declaration')
    map('n', 'gd', vim.lsp.buf.definition, 'LSP: definition')
    map('n', 'gtd', function() require('telescope.builtin').lsp_type_definitions() end, 'LSP: type definitions')
    map('n', 'gr', function() require('telescope.builtin').lsp_references() end, 'LSP: references')
    map('n', 'gi', function() require('telescope.builtin').lsp_implementations() end, 'LSP: implementations')
    map('n', 'gc', function() require('telescope.builtin').lsp_incoming_calls() end, 'LSP: incoming calls')
    map('n', 'gC', function() require('telescope.builtin').lsp_outgoing_calls() end, 'LSP: outgoing calls')
    map('n', 'K',  vim.lsp.buf.hover, 'LSP: hover')
    map('n', 'gl', vim.diagnostic.open_float, 'LSP: diagnostic float')
    map('n', 'g[', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'LSP: prev diagnostic')
    map('n', 'g]', function() vim.diagnostic.jump({ count = 1, float = true }) end, 'LSP: next diagnostic')

    -- Native word highlight (replaces vim-illuminate)
    if client and client.supports_method('textDocument/documentHighlight') then
      local grp = vim.api.nvim_create_augroup('lsp_doc_hl_' .. bufnr, { clear = true })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = bufnr, group = grp, callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = bufnr, group = grp, callback = vim.lsp.buf.clear_references,
      })
    end

    -- Inlay hints where supported
    if client and client.supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})

return M
