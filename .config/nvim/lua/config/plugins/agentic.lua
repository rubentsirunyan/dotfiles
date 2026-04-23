require('agentic').setup({
  provider = 'cursor-acp',
  keymaps = {
    widget = {
      change_mode = {
        {
          '<leader>M',
          mode = { 'n', 'v' },
        },
      },
    },
  },
})

-- Let agentic.nvim draw its own colored window titles / statuslines.
-- Without this, the global `vim.o.winbar` (see config/options.lua) leaks into
-- these windows and agentic.ui.window_decoration backs off, leaving them
-- looking plain. Lualine's `disabled_filetypes` alone doesn't help because
-- lualine isn't the one setting the winbar here.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('AgenticWindowDecoration', { clear = true }),
  pattern = { 'AgenticChat', 'AgenticInput', 'AgenticCode', 'AgenticFiles', 'AgenticTodos' },
  callback = function(args)
    local win = vim.fn.bufwinid(args.buf)
    if win == -1 then return end
    vim.wo[win].winbar = ''
    vim.wo[win].statusline = ' '
  end,
})
