vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

vim.g.NTPNames = {'requirements.txt', 'requirements.yml', 'build.xml', 'pom.xml', 'Makefile', '.project', '.lvimrc', 'README.md', 'LICENSE'}
vim.g.NTPNamesDirs = {'.git', 'venv'}

vim.keymap.set('n', '<leader>n', ':NERDTreeToggle<CR>')

