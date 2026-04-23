-- nvim-treesitter on the `main` branch (new modular API). The plugin itself
-- only manages parsers + queries. Highlighting / folds / indent / textobjects
-- are wired explicitly here.

local nts = require('nvim-treesitter')

-- Optional: configure where parsers/queries are installed (default is fine).
nts.setup()

-- Install a baseline parser set asynchronously. Adjust as needed; add ad-hoc
-- via `:TSInstall <lang>`.
nts.install({
  'bash', 'c', 'comment', 'css', 'csv', 'diff', 'dockerfile',
  'gitcommit', 'gitignore', 'go', 'gomod', 'gosum',
  'graphql', 'hcl', 'html', 'java', 'javascript', 'jsdoc',
  'json', 'lua', 'luadoc', 'make', 'markdown', 'markdown_inline',
  'python', 'query', 'regex', 'ruby', 'rust', 'sql', 'terraform',
  'toml', 'tsx', 'typescript', 'vim', 'vimdoc', 'xml', 'yaml',
})

-- Highlight: enable per filetype via FileType autocmd. Mirrors prior behavior
-- of disabling for `help` and `lua`. pcall in case the parser isn't yet
-- installed for the buffer's filetype (avoids E5108 noise on first open).
-- Skip non-file buffers (telescope previews, terminal, prompt, etc.) to avoid
-- spending parse/highlight cycles on transient buffers.
local highlight_disabled = { help = true, lua = true }
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if highlight_disabled[args.match] then return end
    if vim.bo[args.buf].buftype ~= '' then return end
    pcall(vim.treesitter.start)
  end,
})

-- treesitter-context: API unchanged across nvim-treesitter branches.
require('treesitter-context').setup({ enable = true })

-- treesitter-textobjects (main branch): per-keymap setup, no monolithic
-- config table. Mirrors the old "select" keymaps from the master-branch config.
require('nvim-treesitter-textobjects').setup({
  select = {
    lookahead = true,
    include_surrounding_whitespace = true,
  },
})

local select = require('nvim-treesitter-textobjects.select')
local function map_select(lhs, capture)
  vim.keymap.set({ 'x', 'o' }, lhs, function()
    select.select_textobject(capture, 'textobjects')
  end, { desc = 'TS: select ' .. capture })
end

map_select('af', '@function.outer')
map_select('if', '@function.inner')
map_select('ac', '@class.outer')
map_select('ic', '@class.inner')
map_select('aB', '@block.outer')
map_select('iB', '@block.inner')
