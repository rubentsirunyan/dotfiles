-- Better window navigation
--[[ vim.keymap.set('n', '<C-j>', '<C-W>j') ]]
--[[ vim.keymap.set('n', '<C-k>', '<C-W>k') ]]
--[[ vim.keymap.set('n', '<C-h>', '<C-W>h') ]]
--[[ vim.keymap.set('n', '<C-l>', '<C-W>l') ]]

-- Faster movements
vim.keymap.set("n", "<leader>j", "10j")
vim.keymap.set("n", "<leader>k", "10k")

-- Better line end/beginning
vim.keymap.set({"n", "x"}, "<leader>h", "^")
vim.keymap.set({"n", "x"}, "<leader>l", "$")

-- Better half-page navigation
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")

-- Toggle relative numbers
vim.keymap.set({"n", "x"}, "<leader>r", ":set rnu!<CR>", { desc = "Toggle [r]elative numbers"}) -- TODO: Migrate to pure lua

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>:bd<cr>", { desc = "[Q]uit the current buffer" })

-- Stay in indent mode
vim.keymap.set("x", "<", "<gv", { silent = true })
vim.keymap.set("x", ">", ">gv", { silent = true })

-- Move selected text up and down
vim.keymap.set("n", "<S-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<S-Down>", ":m .+1<CR>==")
vim.keymap.set("i", "<S-Up>", "<ESC>:m .-2<CR>==gi")
vim.keymap.set("i", "<S-Down>", "<ESC>:m .+1<CR>==gi")
vim.keymap.set("x", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<S-Down>", ":m '>+1<CR>gv=gv")

-- Folding
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- File tree
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle [N]eotree"})

-- Misc
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "[P]aste in place of the selected text without yanking it" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Formatting keymaps
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

-- Telescope
-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope file_browser<cr>", { silent = true })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { silent = true })
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { silent = true })
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { silent = true })

-- try with t prefix
vim.keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<cr>", { silent = true })
vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { silent = true })
vim.keymap.set("n", "<leader>tu", "<cmd>Telescope undo<cr>", { silent = true })
vim.keymap.set("n", "<leader>tp", "<cmd>Telescope projects<cr>", { silent = true })
vim.keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { silent = true })
vim.keymap.set("n", "<leader>tk", "<cmd>Telescope keymaps<cr>", { silent = true })
vim.keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>", { silent = true })
