-- Faster movements
vim.keymap.set('n', '<leader>j', '10j')
vim.keymap.set('n', '<leader>k', '10k')

-- Better line end/beginning
vim.keymap.set({ 'n', 'x' }, '<leader>h', '^')
vim.keymap.set({ 'n', 'x' }, '<leader>l', '$')

-- Better half-page navigation
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', '<c-d>', '<c-d>zz')

-- Toggle relative numbers (pure lua, replaces string `:set rnu!<CR>`)
vim.keymap.set({ 'n', 'x' }, '<leader>r', function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = 'Toggle [r]elative numbers' })

-- Navigate buffers
vim.keymap.set('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>q', '<cmd>bd<cr>', { desc = '[Q]uit the current buffer' })

-- Stay in indent mode
vim.keymap.set('x', '<', '<gv', { silent = true, desc = 'Indent left' })
vim.keymap.set('x', '>', '>gv', { silent = true, desc = 'Indent right' })

-- File tree: cwd is auto-managed to the project root by an autocmd in
-- autocmds.lua, so this can stay simple.
vim.keymap.set('n', '<leader>n', ':Neotree toggle reveal_force_cwd<CR>', {
  desc = 'Toggle [N]eotree',
})

-- Misc
vim.keymap.set('x', '<leader>p', '"_dp', { desc = '[P]aste in place of the selected text without yanking it' })

-- Diff
vim.keymap.set('n', '<leader>dd', function()
  if vim.wo.diff then
    vim.cmd('windo diffoff')
  else
    vim.cmd('windo diffthis')
  end
end, { desc = '[D]iff toggle' })

vim.keymap.set({'n', 'x'}, '<leader>dg', ':diffget', { silent = true, desc = '[D]iff [g]et from the other file (hunk or selection)' })
vim.keymap.set({'n', 'x'}, '<leader>dp', ':diffput', { silent = true, desc = '[D]iff [p]ut to the other file (hunk or selection)' })
vim.keymap.set('n', '<leader>dG', '<cmd>%diffget<CR>', { desc = '[D]iff [g]et all hunks' })
vim.keymap.set('n', '<leader>dP', '<cmd>%diffput<CR>', { desc = '[D]iff [p]ut all hunks' })

-- Git
vim.keymap.set('n', '<leader>gs', function() require('neogit').open() end, { desc = 'Open Neo[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gc', '<cmd>Neogit commit<CR>', { desc = 'Neo[G]it [C]ommit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Neogit pull<CR>', { desc = 'Neo[G]it [P]ull' })
vim.keymap.set('n', '<leader>gP', '<cmd>Neogit push<CR>', { desc = 'Neo[G]it [P]ush' })
vim.keymap.set('n', '<leader>gdv', '<cmd>DiffviewOpen<CR>', { desc = '[G]it [D]iff [V]iew' })
vim.keymap.set('n', '<leader>gdh', '<cmd>Gitsigns preview_hunk_inline<CR>', { desc = '[G]it [D]iff [H]unk' })
vim.keymap.set('n', '<leader>gB', '<cmd>Gitsigns blame<CR>', { desc = '[G]itsigns [B]lame' })
vim.keymap.set('n', '<leader>gn', '<cmd>Gitsigns next_hunk<CR>', { desc = '[G]itsigns [n]ext hunk' })
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { desc = 'Telescope [G]it [B]ranches' })
vim.keymap.set('n', '<leader>gl', '<cmd>Telescope git_commits<CR>', { desc = 'Telescope [G]it [L]og' })
vim.keymap.set('n', '<leader>gh', '<cmd>Telescope git_bcommits<CR>', { desc = 'Telescope [G]it file [H]istory' })
vim.keymap.set('v', '<leader>gh', '<cmd>Telescope git_bcommits_range<CR>', { desc = 'Telescope [G]it selection [H]istory' })

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { silent = true })
vim.keymap.set('n', '<leader>fg', function()
  require('telescope').extensions.live_grep_args.live_grep_args()
end, { silent = true })
vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<cr>', { silent = true })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { silent = true })
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { silent = true })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { silent = true })
vim.keymap.set('n', '<leader>fds', '<cmd>Telescope lsp_document_symbols<cr>', { silent = true })
vim.keymap.set('n', '<leader>fws', '<cmd>Telescope lsp_workspace_symbols<cr>', { silent = true })

-- Formatting
vim.keymap.set('n', '<leader>F', function()
  require('conform').format({ async = false, lsp_fallback = true })
end, { desc = '[F]ormat the current buffer' })

-- Agentic
vim.keymap.set('n', '<leader>aa', function() require('agentic').toggle() end, { desc = 'Toggle [A]gentic chat' })
vim.keymap.set('n', '<leader>an', function() require('agentic').new_session() end, { desc = '[A]gentic [n]ew session' })
vim.keymap.set('n', '<leader>as', function() require('agentic').stop_generation() end, { desc = '[A]gentic [s]top generation' })
vim.keymap.set({ 'n', 'v' }, '<leader>ac', function() require('agentic').add_selection_or_file_to_context() end, { desc = '[A]gentic add selection/file to [c]ontext' })

-- Pack
vim.keymap.set('n', '<leader>Pc', function()
  local inactive = vim.iter(vim.pack.get())
    :filter(function(p) return not p.active end)
    :map(function(p) return p.spec.name end)
    :totable()

  if #inactive == 0 then
    vim.notify('vim.pack: nothing to clean', vim.log.levels.INFO)
    return
  end

  vim.pack.del(inactive)
end, { desc = '[P]ack [c]lean inactive plugins' })
