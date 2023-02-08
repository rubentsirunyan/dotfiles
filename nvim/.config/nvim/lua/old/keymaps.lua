-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Better window navigation
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')


vim.keymap.set('n', '<leader>j', '10j')
vim.keymap.set('n', '<leader>k', '10k')
vim.keymap.set('n', '<leader>h', '10h')
vim.keymap.set('n', '<leader>l', '10l')

-- Navigate buffers
vim.keymap.set('n', '<A-b>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<A-B>', ':bprevious<CR>', { silent = true })

-- Misc
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', { desc = '[ CD] Switch CWD to the directory of the open buffer' })

vim.keymap.set('v', '<leader>p', '"_dP', { desc = '[ P]aste in place of the selected text without yanking it'})


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

