-- Leader keys (must be set before plugins load)
vim.keymap.set({ 'n', 'x' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.options')
require('config.autocmds')
require('config.diagnostics')
require('config.pack')

-- Colorscheme must load before the plugin configs below: plugins such as neogit
-- derive their own highlight palette from the active colorscheme at setup time,
-- so loading it last leaves them with colors from the default scheme.
vim.cmd.colorscheme('gruvbox')

require('config.lsp')
require('config.keymaps')

for _, name in ipairs({
  'blink',
  'conform',
  'nvim-lint',
  'lualine',
  'neo-tree',
  'statuscol',
  'mini',
  'treesitter',
  'gitsigns',
  'neogit',
  'diffview',
  'telescope',
  -- 'hardtime',
  'agentic',
  'im-select',
  'profile',
  'mason',
}) do require('config.plugins.' .. name) end
