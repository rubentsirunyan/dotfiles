-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
--[[ vim.keymap.set('n', '<C-j>', '<C-W>j') ]]
--[[ vim.keymap.set('n', '<C-k>', '<C-W>k') ]]
--[[ vim.keymap.set('n', '<C-h>', '<C-W>h') ]]
--[[ vim.keymap.set('n', '<C-l>', '<C-W>l') ]]

-- Faster movements
vim.keymap.set("n", "<leader>j", "10j")
vim.keymap.set("n", "<leader>k", "10k")
vim.keymap.set("n", "<leader>h", "10h")
vim.keymap.set("n", "<leader>l", "10l")

-- Better half-page navigation
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- Move selected text up and down
vim.keymap.set("n", "<S-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<S-Down>", ":m .+1<CR>==")
vim.keymap.set("i", "<S-Up>", "<ESC>:m .-2<CR>==gi")
vim.keymap.set("i", "<S-Down>", "<ESC>:m .+1<CR>==gi")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")

-- Folding
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- File tree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")

-- Misc
vim.keymap.set(
	"n",
	"<leader>cd",
	":cd %:p:h<cr>:pwd<cr>",
	{ desc = "[ CD] Switch CWD to the directory of the open buffer" }
)
vim.keymap.set("v", "<leader>p", "\"_dP", { desc = "[ P]aste in place of the selected text without yanking it" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Formatting keymaps
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope file_browser<cr>", { silent = true })
vim.keymap.set("n", "<c-p>", "<cmd>Telescope git_files<cr>", { silent = true })
vim.keymap.set("n", "<c-t>", "<cmd>Telescope live_grep<cr>", { silent = true })
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { silent = true })
