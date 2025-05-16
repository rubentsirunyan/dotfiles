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
vim.keymap.set("x", "<", "<gv", { silent = true, desc = "Indent left" })
vim.keymap.set("x", ">", ">gv", { silent = true, desc = "Indent right" })

-- Move selected text up and down
vim.keymap.set("n", "<S-Up>", ":m .-2<CR>==", { desc = "Move selected text up" })
vim.keymap.set("n", "<S-Down>", ":m .+1<CR>==", { desc = "Move selected text down" })
vim.keymap.set("i", "<S-Up>", "<ESC>:m .-2<CR>==gi", { desc = "Move selected text up" })
vim.keymap.set("i", "<S-Down>", "<ESC>:m .+1<CR>==gi", { desc = "Move selected text down" })
vim.keymap.set("x", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
vim.keymap.set("x", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })

-- Folding
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- File tree
vim.keymap.set("n", "<leader>n", ":Neotree toggle reveal_force_cwd<CR>", { desc = "Toggle [N]eotree"})

-- Misc
vim.keymap.set("x", "<leader>p", "\"_dp", { desc = "[P]aste in place of the selected text without yanking it" })

-- Formatting keymaps
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "[F]ormat the curernt buffer"})

-- LazyGit
-- vim.keymap.set("n", "<leader>g", ":LazyGit<CR>", { desc = "Open Lazy[G]it" })
vim.keymap.set("n", "<leader>gs", require("neogit").open, { desc = "Open Neo[G]it [S]status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Neo[G]it [C]commit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Neogit pull<CR>", { desc = "Neo[G]it [P]ull" })
vim.keymap.set("n", "<leader>gP", "<cmd>Neogit push<CR>", { desc = "Neo[G]it [P]ush" })
vim.keymap.set("n", "<leader>gP", "<cmd>Neogit push<CR>", { desc = "Neo[G]it [P]ush" })
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "[G]it [D]iff (with DiffviewOpen)" })
vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns blame<CR>", { desc = "[G]itsigns [B]lame" })
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Telescope [G]it [B]ranches" })
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope git_commits<CR>", { desc = "Telescope [G]it [L]og" })
vim.keymap.set("n", "<leader>gh", "<cmd>Telescope git_bcommits<CR>", { desc = "Telescope [G]it file [H]istory" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { silent = true })
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { silent = true })
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope harpoon marks<cr>", { silent = true })
vim.keymap.set("n", "<leader>fds", "<cmd>Telescope lsp_document_symbols<cr>", { silent = true })
vim.keymap.set("n", "<leader>fws", "<cmd>Telescope lsp_workspace_symbols<cr>", { silent = true })
