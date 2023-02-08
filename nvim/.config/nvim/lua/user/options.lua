-- Line numbers
vim.o.number = true -- set numbered lines
vim.o.relativenumber = false -- set relative numbered lines
vim.o.numberwidth = 2 -- set number column width {default 4}

-- Enable mouse mode
vim.o.mouse = 'a' -- allow the mouse to be used in neovim

-- History and undo
vim.o.history = 700 -- number of entries to be stored in the history
vim.o.undolevels = 700 -- maximum number of changes that can be undone
vim.o.undofile = true -- save undo history to an undo file

-- Splits
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.splitbelow = true -- force all horizontal splits to go below current window

-- Clipboard
vim.o.clipboard = 'unnamed' -- use system clipboard

-- Indents
vim.o.breakindent = true -- every wrapped line will continue visually indented

-- Text wrapping
vim.o.wrap = true -- wrap lines
vim.o.linebreak = true -- companion to wrap, don't split words

-- Search
vim.o.ignorecase = true -- ignore case while searching
vim.o.smartcase = true -- smart case
vim.o.incsearch = true -- incremental serach
vim.o.hlsearch = true -- highlight search

-- Diff
vim.o.diffopt = 'vertical,filler,context:3,indent-heuristic,algorithm:patience,internal'

-- Disable stupid backup and swap files
vim.o.backup = false -- do not make a backup
vim.o.writebackup = false -- do not make a backup before overwriting a file
vim.o.swapfile = false -- do not create swap files

-- tab related
vim.o.tabstop = 2 -- number of spaces for the tab
vim.o.softtabstop = 2
vim.o.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.o.expandtab = true -- use spaces instead of tabs

-- Set colorscheme
vim.o.termguicolors = true -- enables 24-bit RGB color in the TUI

-- Completion
vim.o.completeopt = 'menuone,noselect' -- list of options for Insert mode completion

-- Folding
vim.o.foldmethod = 'expr' -- fold method
vim.o.foldexpr = 'nvim_treesitter#foldexpr()' -- set fold expression to treesitter
vim.o.foldlevel = 99 -- open all folds by default
