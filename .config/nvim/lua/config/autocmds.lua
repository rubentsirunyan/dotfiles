-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Terraform: :AddMissingImports creates `import { to = ... }` blocks for
-- addresses in the right split that don't already exist in the left split.
vim.api.nvim_create_user_command('AddMissingImports', function()
  require('config.utils.terraform').add_missing_imports()
end, { desc = 'Terraform: add missing import blocks from right split' })

-- Auto-set cwd to the project root for the current buffer (replaces
-- project.nvim). Prefers the LSP client's `root_dir` when an LSP is attached
-- (so per-server `root_markers` in lsp/<name>.lua remain the single source of
-- truth). Falls back to nearest `.git` ancestor via vim.fs.root.
local function detect_project_root(bufnr)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if client.config.root_dir then
      return client.config.root_dir
    end
  end
  return vim.fs.root(bufnr, '.git')
end

vim.api.nvim_create_autocmd({ 'BufReadPost', 'LspAttach' }, {
  callback = function(args)
    if vim.bo[args.buf].buftype ~= '' then return end
    local root = detect_project_root(args.buf)
    if root and root ~= vim.fn.getcwd() then
      vim.cmd('cd ' .. vim.fn.fnameescape(root))
    end
  end,
})

-- Companion to the BufReadPost autocmd: when nvim is launched with a
-- directory argument (e.g. `nvim ~/dotfiles/.config/`), neo-tree's
-- hijack opens that directory as its tree root before BufReadPost ever fires.
-- This autocmd kicks in at VimEnter, finds the project root from the directory,
-- changes cwd, and re-opens neo-tree at the root with the original directory
-- revealed.
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local arg = vim.fn.argv(0)
    if type(arg) ~= 'string' or arg == '' then return end
    if vim.fn.isdirectory(arg) ~= 1 then return end

    local abs = vim.fn.fnamemodify(arg, ':p'):gsub('/$', '')
    local root = vim.fs.root(abs, '.git') or abs

    if root ~= vim.fn.getcwd() then
      vim.cmd('cd ' .. vim.fn.fnameescape(root))
    end

    if root ~= abs then
      vim.schedule(function()
        pcall(vim.cmd, 'Neotree close')

        -- neo-tree's reveal_file requires a real file path, not a directory.
        -- Find any file inside `abs` (any depth) so we can reveal it, which
        -- side-effect-expands the directory in the tree.
        local files = vim.fs.find(function() return true end, {
          path = abs, type = 'file', limit = 1,
        })
        local reveal = files[1]

        local cmd = 'Neotree dir=' .. vim.fn.fnameescape(root)
        if reveal then
          cmd = cmd .. ' reveal_file=' .. vim.fn.fnameescape(reveal)
        end
        vim.cmd(cmd)
      end)
    end
  end,
})
