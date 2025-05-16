-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"nvim-lua/plenary.nvim",
	}, -- Useful lua functions used ny lots of plugins

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{
				"linrongbin16/lsp-progress.nvim",
			},
		},
	}, -- Fancier statusline
	{
		"LunarVim/bigfile.nvim",
	},
  {
    "echasnovski/mini.nvim"
  },
	{
		"numToStr/Comment.nvim",
	}, -- Easily comment stuff
	{
		"akinsho/bufferline.nvim",
	}, -- Bufferline
	{
		"christoomey/vim-tmux-navigator",
	}, -- tmux navigations
	-- Git
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"sindrets/diffview.nvim",
	},
	{
		"NeogitOrg/neogit",
	},
	-- File tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			{
				"kyazdani42/nvim-web-devicons",
			},
			{
				"MunifTanjim/nui.nvim",
			},
		},
	},

	-- Projects
	{
		"ahmedkhalf/project.nvim",
	},

	-- Colorschemes
	{
		"ellisonleao/gruvbox.nvim",
	}, -- Gruvbox

	-- cmp plugins
	{
		"hrsh7th/nvim-cmp",
	}, -- The completion plugin
	{
		"hrsh7th/cmp-buffer",
	}, -- buffer completions
	{
		"hrsh7th/cmp-path",
	}, -- path completions
	{
		"hrsh7th/cmp-cmdline",
	}, -- cmdline completions
	{
		"saadparwaiz1/cmp_luasnip",
	}, -- snippet completions
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-nvim-lua",
	},

	-- lspkind - Add symbols to autocomplete
	{
		"onsails/lspkind.nvim",
	},

	-- snippets
	{
		"L3MON4D3/LuaSnip",
	}, --snippet engine
	{
		"rafamadriz/friendly-snippets",
	}, -- a bunch of snippets to use

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
			},
			{
				"williamboman/mason-lspconfig.nvim",
			},
		},
	},

	{
		"linux-cultist/venv-selector.nvim",
		branch = "regexp",
		event = "VeryLazy",
		config = function()
			require("venv-selector").setup({
			})
		end,
	},

	{
		"j-hui/fidget.nvim",
	},

	-- Null-LS
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
	},

	{
		"b0o/schemastore.nvim",
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"debugloop/telescope-undo.nvim",
			},
		},
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
	},
	{
		"1riz/telescope-macros.nvim",
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"RRethy/vim-illuminate",
	},
	-- Folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			{
				"kevinhwang91/promise-async",
			},
		},
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{
				"tpope/vim-dadbod",
				lazy = true,
			},
			{
				"kristijanhusak/vim-dadbod-completion",
				ft = { "sql", "mysql", "plsql" },
				lazy = true,
			},
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	-- Profiler
	{
		"stevearc/profile.nvim",
	},
	{
		"cossonleo/dirdiff.nvim",
	},
	-- Be Good!
	{
		"ThePrimeagen/vim-be-good",
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		event = "BufEnter",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
