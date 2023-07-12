-- Leader key must be set before plugins are loaded
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('user.plugins')
require('user.options')
require('user.keymaps')
require('user.autocommands')
require('user.colorscheme')
require('user.plugin_configs')


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
