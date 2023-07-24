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
		commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
	}, -- Useful lua functions used ny lots of plugins

	{
		"nvim-lualine/lualine.nvim",
		commit = "0050b308552e45f7128f399886c86afefc3eb988",
	}, -- Fancier statusline

	{
		"windwp/nvim-autopairs",
		commit = "28f57e6a6f0b37ec52c257230990b81afa1863e4",
	}, -- Autopairs, integrates with both cmp and treesitter
	{
		"numToStr/Comment.nvim",
		commit = "eab2c83a0207369900e92783f56990808082eac2",
	}, -- Easily comment stuff
	{
		"akinsho/bufferline.nvim",
		commit = "c7492a76ce8218e3335f027af44930576b561013",
	}, -- Bufferline
	{
		"christoomey/vim-tmux-navigator",
		commit = "cdd66d6a37d991bba7997d593586fc51a5b37aa8",
	}, -- tmux navigations
	{
		"kylechui/nvim-surround",
		commit = "ad56e6234bf42fb7f7e4dccc7752e25abd5ec80e",
	}, -- Add/delete/change surrounding pairs

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		commit = "ec4742a7eebf68bec663041d359b95637242b5c3",
	},
  {
    "kdheepak/lazygit.nvim",
    commit = "146c6294bf0b4db1572fa7232039aaa9003a52b9",
  },
	-- File tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		commit = "7f6fa04dbd8e8c79d1af33bc90e856b65d8641da",
		dependencies = {
			{
				"kyazdani42/nvim-web-devicons",
				commit = "ade34ca7d19543904b28b903e606be8930fb9ee3",
			},
			{
				"MunifTanjim/nui.nvim",
				commit = "d146966a423e60699b084eeb28489fe3b6427599",
			},
		},
	},

	-- Projects
	{
		"ahmedkhalf/project.nvim",
		commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
	},

	-- Colorschemes
	{
		"navarasu/onedark.nvim",
		commit = "a55d0b62326341bf6ac0538d2d88836ac1cd77e5",
	}, -- Theme inspired by Atom

	{
		"ellisonleao/gruvbox.nvim",
		commit = "73f009df5ed929a853244c413bb52c1d02c117ce",
	}, -- Gruvbox

	-- cmp plugins
	{
		"hrsh7th/nvim-cmp",
		commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d",
	}, -- The completion plugin
	{
		"hrsh7th/cmp-buffer",
		commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
	}, -- buffer completions
	{
		"hrsh7th/cmp-path",
		commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
	}, -- path completions
	{
		"hrsh7th/cmp-cmdline",
		commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
	}, -- cmdline completions
	{
		"saadparwaiz1/cmp_luasnip",
		commit = "18095520391186d634a0045dacaa346291096566",
	}, -- snippet completions
	{
		"hrsh7th/cmp-nvim-lsp",
		commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
	},
	{
		"hrsh7th/cmp-nvim-lua",
		commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
	},

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		commit = "9bff06b570df29434a88f9c6a9cea3b21ca17208",
	}, --snippet engine
	{
		"rafamadriz/friendly-snippets",
		commit = "a6f7a1609addb4e57daa6bedc300f77f8d225ab7",
	}, -- a bunch of snippets to use

	-- LSP
	{
		"neovim/nvim-lspconfig",
		commit = "d3c82d2f9a6fd91ec1ffee645664d2cc57e706d9",
		dependencies = {
			{
				"williamboman/mason.nvim",
				commit = "6f8f1ab3f4c5193578797b0d89afa7c497398bb1",
			},
			{
				"williamboman/mason-lspconfig.nvim",
				commit = "53f3a8bdcb77d4a95b082fd57e12173f353c6c3e",
			},
		},
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		commit = "60b4a7167c79c7d04d1ff48b55f2235bf58158a7",
	},

	{
		"jay-babu/mason-null-ls.nvim",
		commit = "9ad7503c32545ee6e8000e52d9ae4a93d49231fb",
	},

	-- LSP progress
	-- {
	-- 	"nvim-lua/lsp-status.nvim",
	-- 	commit = "54f48eb5017632d81d0fd40112065f1d062d0629",
	-- 	config = function()
	-- 		require("lsp-status").register_progress()
	-- 	end
	-- },

  {
    "b0o/schemastore.nvim",
    commit = "cd5c2a0db954011fcbeac7bbbc0c7ae9e23626e3",
  },
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		commit = "203bf5609137600d73e8ed82703d6b0e320a5f36",
		dependencies = {
			{
				"debugloop/telescope-undo.nvim",
				commit = "3dec002ea3e7952071d26fbb5d01e2038a58a554",
			},
		},
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		commit = "513e4ee385edd72bf0b35a217b7e39f84b6fe93c",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		commit = "a18f78121d74c4fae9edd29e138a918a8ede2a70",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		-- commit = "df6f3220890d8641067bfee0718244e46d9693dd",
		commit = "3af1220e18034eb2ce7d1c8e77055bc3bf3c1c36",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		commit = "63f3ffc50b0afc59be1015153d00922498085be8",
	},

	-- Folding
	{
		"kevinhwang91/nvim-ufo",
		commit = "43e39ec74cd57c45ca9d8229a796750f6083b850",
		dependencies = {
			{
				"kevinhwang91/promise-async",
				commit = "e94f35161b8c5d4a4ca3b6ff93dd073eb9214c0e",
			},
		},
	},

	-- Be Good!
	{
		"ThePrimeagen/vim-be-good",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
