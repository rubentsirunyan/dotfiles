-- vim.pack manifest. Plugins are cloned to stdpath('data')/site/pack/core/opt/
-- and auto-loaded. Adding entries here and restarting nvim installs them.

vim.pack.add({
  -- core deps
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },

  -- LSP + tooling
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/b0o/schemastore.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' }, -- formatting
  { src = 'https://github.com/zapling/mason-conform.nvim' }, -- autoinstall formatters
  { src = 'https://github.com/mfussenegger/nvim-lint' }, -- linting
  { src = 'https://github.com/rshkarin/mason-nvim-lint' }, -- autoisntall linters

  -- Completion
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('*') },

  -- UI
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },
  { src = 'https://github.com/luukvbaal/statuscol.nvim' },

  -- Editing
  { src = 'https://github.com/echasnovski/mini.nvim' },
  -- Requires tree-sitter CLI in PATH (mise-managed).
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },

  -- Git
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/NeogitOrg/neogit' },
  { src = 'https://github.com/sindrets/diffview.nvim' },

  -- Telescope
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/debugloop/telescope-undo.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-live-grep-args.nvim' },

  -- Misc
  { src = 'https://github.com/christoomey/vim-tmux-navigator' },
  { src = 'https://github.com/keaising/im-select.nvim' }, -- switch input to english in normal mode
  { src = 'https://github.com/m4xshen/hardtime.nvim' },
  -- { src = 'https://github.com/stevearc/profile.nvim' },
  { src = 'https://github.com/carlos-algms/agentic.nvim' },
})
