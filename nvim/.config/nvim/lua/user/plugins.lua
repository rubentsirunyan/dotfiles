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
		-- commit = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683",
	}, -- Useful lua functions used ny lots of plugins

	{
		"nvim-lualine/lualine.nvim",
		-- commit = "544dd1583f9bb27b393f598475c89809c4d5e86b",
		dependencies = {
			-- LSP progress
			{
				"linrongbin16/lsp-progress.nvim",
				-- commit = "d5f4d28efe75ce636bfbe271eb45f39689765aab",
			},
		},
	}, -- Fancier statusline
	{
		"LunarVim/bigfile.nvim",
		-- commit = "33eb067e3d7029ac77e081cfe7c45361887a311a",
	},
	{
		"windwp/nvim-autopairs",
		-- commit = "e38c5d837e755ce186ae51d2c48e1b387c4425c6",
	}, -- Autopairs, integrates with both cmp and treesitter
	{
		"numToStr/Comment.nvim",
		-- commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
	}, -- Easily comment stuff
	{
		"akinsho/bufferline.nvim",
		-- commit = "0b2fd861eee7595015b6561dade52fb060be10c4",
	}, -- Bufferline
	{
		"christoomey/vim-tmux-navigator",
		-- commit = "cdd66d6a37d991bba7997d593586fc51a5b37aa8",
	}, -- tmux navigations
	{
		"kylechui/nvim-surround",
		-- commit = "0855a89e00a5822c3a482a82e5223fcf2e9ede13",
	}, -- Add/delete/change surrounding pairs

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		-- commit = "6ef8c54fb526bf3a0bc4efb0b2fe8e6d9a7daed2",
	},
	{
		"kdheepak/lazygit.nvim",
		-- commit = "146c6294bf0b4db1572fa7232039aaa9003a52b9",
	},
	{
		"sindrets/diffview.nvim",
		-- commit = "4516612fe98ff56ae0415a259ff6361a89419b0a",
	},
	{
		"NeogitOrg/neogit",
		-- tag = "v0.0.1",
		config = true,
	},
	-- File tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		-- commit = "230ff118613fa07138ba579b89d13ec2201530b9",
		dependencies = {
			{
				"kyazdani42/nvim-web-devicons",
				-- commit = "5efb8bd06841f91f97c90e16de85e96d57e9c862",
			},
			{
				"MunifTanjim/nui.nvim",
				-- commit = "1d044afde83e73c56de8e176615a4a6e7c8cf0e3",
			},
		},
	},

	-- Projects
	{
		"ahmedkhalf/project.nvim",
		-- commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
	},

	-- Colorschemes
	{
		"ellisonleao/gruvbox.nvim",
		-- commit = "0940564208a490c173216c3b7d2188b0a5ad3491",
	}, -- Gruvbox

	-- cmp plugins
	{
		"hrsh7th/nvim-cmp",
		-- commit = "0b751f6beef40fd47375eaf53d3057e0bfa317e4",
	}, -- The completion plugin
	{
		"hrsh7th/cmp-buffer",
		-- commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
	}, -- buffer completions
	{
		"hrsh7th/cmp-path",
		-- commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
	}, -- path completions
	{
		"hrsh7th/cmp-cmdline",
		-- commit = "8ee981b4a91f536f52add291594e89fb6645e451",
	}, -- cmdline completions
	{
		"saadparwaiz1/cmp_luasnip",
		-- commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
	}, -- snippet completions
	{
		"hrsh7th/cmp-nvim-lsp",
		-- commit = "44b16d11215dce86f253ce0c30949813c0a90765",
	},
	{
		"hrsh7th/cmp-nvim-lua",
		-- commit = "f12408bdb54c39c23e67cab726264c10db33ada8",
	},

	-- lspkind - Add symbols to autocomplete
	{
		"onsails/lspkind.nvim",
		-- commit = "1735dd5a5054c1fb7feaf8e8658dbab925f4f0cf",
	},

	-- codeium
	--  {
	-- 	"Exafunction/codeium.nvim",
	-- 	commit = "cd5913ff5481229b15186293d1d46dd9500789f9",
	--    dependencies = {
	--        "nvim-lua/plenary.nvim",
	--        "hrsh7th/nvim-cmp",
	--    },
	-- },

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		-- commit = "9bff06b570df29434a88f9c6a9cea3b21ca17208",
	}, --snippet engine
	{
		"rafamadriz/friendly-snippets",
		-- commit = "53d3df271d031c405255e99410628c26a8f0d2b0",
	}, -- a bunch of snippets to use

	-- LSP
	{
		"neovim/nvim-lspconfig",
		-- commit = "694aaec65733e2d54d393abf80e526f86726c988",
		dependencies = {
			{
				"williamboman/mason.nvim",
				-- commit = "41e75af1f578e55ba050c863587cffde3556ffa6",
			},
			{
				"williamboman/mason-lspconfig.nvim",
				-- commit = "4eb8e15e3c0757303d4c6dea64d2981fc679e990",
			},
		},
	},

	{
		"linux-cultist/venv-selector.nvim",
		-- commit = "d946b1e86212f38ff9c42e3b622a8178bbc93461",
		branch = "regexp",
		event = "VeryLazy",
		config = function()
			require("venv-selector").setup({
				-- Your options go here
				-- name = "venv",
				-- auto_refresh = false
			})
		end,
	},

	{
		"j-hui/fidget.nvim",
		-- commit = "a4a7edfea37e557dbff5509ee374ffb57051bba9",
	},

	-- Null-LS
	{
		-- "jose-elias-alvarez/null-ls.nvim",
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		-- commit = "60b4a7167c79c7d04d1ff48b55f2235bf58158a7",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		-- commit = "ae0c5fa57468ac65617f1bf821ba0c3a1e251f0c",
	},

	-- Harpoon
	-- {
	-- 	"theprimeagen/harpoon",
	-- 	-- commit = "581da797f9d66485f841525af596255270c2bcf5",
	-- },

	{
		"b0o/schemastore.nvim",
		-- commit = "cd5c2a0db954011fcbeac7bbbc0c7ae9e23626e3",
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		-- commit = "203bf5609137600d73e8ed82703d6b0e320a5f36",
		dependencies = {
			{
				"debugloop/telescope-undo.nvim",
				-- commit = "3dec002ea3e7952071d26fbb5d01e2038a58a554",
			},
		},
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		-- commit = "513e4ee385edd72bf0b35a217b7e39f84b6fe93c",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		-- commit = "a18f78121d74c4fae9edd29e138a918a8ede2a70",
	},
	{
		"1riz/telescope-macros.nvim",
		-- commit = "22f75816c905f2beab3ee2c7ad115f8e0e397cad",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		-- commit = "0da349ed303bea955942f409d29059cdb89dbe2c",
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		-- commit = "c9f2b429a1d63023f7a33b5404616f4cd2a109c5",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- commit = "85b9d0cbd4ff901abcda862b50dbb34e0901848b",
	},
	-- {
	-- 	"theHamsta/nvim-treesitter-pairs",
	-- 	commit = "f8c195d4d8464cba6971bf8de2d6a5c8c109b37a",
	-- },
	{
		"RRethy/vim-illuminate",
		-- commit = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86",
	},

	-- Folding
	{
		"kevinhwang91/nvim-ufo",
		-- commit = "43e39ec74cd57c45ca9d8229a796750f6083b850",
		dependencies = {
			{
				"kevinhwang91/promise-async",
				-- commit = "94f6f03c6c1e2aab551aacdf0c1e597a7269abb6",
			},
		},
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		-- commit = "23ed6edb60dcef9b30b741ca4b00ac4637da7d69",
		dependencies = {
			{
				"tpope/vim-dadbod",
				-- commit = "37523ffe0849b51db07fa7f48430c2aca5420a0e",
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
	-- {
	--   "rmagatti/auto-session",
	--   commit = "af2219b9fa99c1d7ac409bd9eac094c459d3f52d",
	-- },
	-- Profiler
	{
		"stevearc/profile.nvim",
	},

	{ dir = "~/Documents/work/me/dirdiff.nvim" },

	-- {
	-- 	"cossonleo/dirdiff.nvim",
	-- },

	-- Be Good!
	{
		"ThePrimeagen/vim-be-good",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
