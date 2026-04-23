-- Line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2

-- Cursor
vim.o.scrolloff = 10
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

-- Mouse
vim.o.mouse = 'a'

-- History and undo
vim.o.history = 700
vim.o.undolevels = 700
vim.o.undofile = true

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Clipboard
vim.o.clipboard = 'unnamed'

-- Indents
vim.o.breakindent = true

-- Text wrapping
vim.o.wrap = true
vim.o.linebreak = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- Diff
vim.o.diffopt = 'vertical,filler,context:3,indent-heuristic,algorithm:patience,internal'

-- Disable backup/swap
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Tabs
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Colors
vim.o.termguicolors = true

-- Completion
vim.o.completeopt = 'menuone,noselect'

-- Sign column: always reserve 2 columns so gitsigns markers and LSP diagnostic
-- icons can both be visible on the same line. 'auto' would hide gitsigns
-- whenever a diagnostic (higher priority) is present.
vim.o.signcolumn = 'yes:2'

-- Folding (native + treesitter, replaces nvim-ufo)
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = '' -- 0.11+: empty string shows actual fold content
vim.o.foldcolumn = 'auto'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:⏵]]

-- CursorHold latency (for LSP word-highlight snappiness)
vim.o.updatetime = 300

-- Python path
vim.g.python3_host_prog = vim.fn.exepath('python3')
