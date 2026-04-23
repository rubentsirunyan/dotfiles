local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local previewers = require('telescope.previewers')

-- -- Flatten window-local options inside telescope previewers so files of
-- -- differing fold depth / number layout don't visually "shift" as you scroll
-- -- through results. Triggered once per preview-window attach.
-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'TelescopePreviewerLoaded',
--   callback = function(args)
--     vim.opt_local.foldcolumn = '0'
--     vim.opt_local.foldenable = false
--     vim.opt_local.relativenumber = false
--     vim.opt_local.number = false
--     vim.opt_local.signcolumn = 'no'
--     vim.opt_local.cursorline = false
--     vim.opt_local.cursorcolumn = false
--     vim.opt_local.wrap = false
--     vim.opt_local.list = false
--     vim.opt_local.conceallevel = 0
--     -- Stop any treesitter highlight on the preview buffer (avoids virt_text /
--     -- conceal artifacts that vary per file).
--     if args.data and args.data.bufnr then
--       pcall(vim.treesitter.stop, args.data.bufnr)
--     end
--     -- Reset cursor + view to top-left so we don't carry over horizontal
--     -- scroll from the previous file.
--     vim.cmd('normal! gg0')
--   end,
-- })

telescope.setup({
	hidden = true,
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "filename_first" },
    file_ignore_patterns = {
      "^.git/",
      "^node_modules/",
    },

		mappings = {
			i = {
				["<C-z>"] = actions.cycle_previewers_next,
				["<C-a>"] = actions.cycle_previewers_prev,
				["<C-p>"] = require("telescope.actions.layout").toggle_preview,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_vertical,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = false,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["q"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_vertical,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<leader>q"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
			-- theme = "dropdown",
			-- previewer = false,
		},
		git_files = {
			show_untracked = true,
			-- theme = "dropdown",
			-- previewer = false,
		},
    git_commits = {
      git_command = {
        "git", "log", "--color=always", "--date=short", "--pretty=format:%h %ad %an %s%n", "--", ".",
      },
    },
    git_bcommits = {
      git_command = {
        "git", "log", "--color=always", "--date=short", "--pretty=format:%h %ad %an %s%n",
      },
    },
    git_bcommits_range = {
      git_command = {
        "git", "log", "--color=always", "--date=short", "--pretty=format:%h %ad %an %s%n", "--no-patch","-L",
      },
    },
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
		},
		buffers = {
			-- theme = "dropdown",
			-- previewer = false,
		},
		help_tags = {
			theme = "dropdown",
			previewer = false,
		},
	},
	extensions = {
		undo = {
			-- theme = "dropdown",
			-- previewer = true,
			use_delta = false,
			mappings = {
				i = {
					-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
					-- you want to replicate these defaults and use the following actions. This means
					-- installing as a dependency of telescope in it's `requirements` and loading this
					-- extension from there instead of having the separate plugin definition as outlined
					-- above.
					["<cr>"] = require("telescope-undo.actions").restore,
				},
			},
		},
		-- harpoon = {},
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			additional_args = function()
        return {
          "--hidden",             -- include dotfiles
          "--no-ignore",          -- skip .gitignore / .ignore
          "--glob", "!**/.git/**",
          "--glob", "!**/node_modules/**",
          "--glob", "!**/.pnpm-store/**",
          "--glob", "!**/.yarn/**",
          "--glob", "!**/.cache/**",
          "--glob", "!**/dist/**",
          "--glob", "!**/build/**",
          "--glob", "!**/coverage/**",
          "--glob", "!**/.next/**",   -- Next.js
          "--glob", "!**/.nuxt/**",   -- Nuxt
          "--glob", "!**/target/**",  -- Rust/Java
          "--glob", "!**/__pycache__/**",
          "--glob", "!**/.pytest_cache/**",
          "--glob", "!**/.mypy_cache/**",
          "--glob", "!**/venv/**",
          "--glob", "!**/.venv/**",
          "--glob", "!**/vendor/**",  -- PHP/Go vendoring
          "--glob", "!**/.gradle/**",
        }
			end,
			-- define mappings, e.g.
			mappings = { -- extend mappings
				i = {
					["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
					-- freeze the current list and start a fuzzy search in the frozen list
					["<C-f>"] = require("telescope-live-grep-args.actions").to_fuzzy_refine,
				},
			},
		},
	},
})

-- Fall back to find_files if git_files can't find a .git directory
-- _G.project_files = function()
--   local opts = {} -- define here if you want to define something
--   vim.fn.system('git rev-parse --is-inside-work-tree')
--   if vim.v.shell_error == 0 then
--     require"telescope.builtin".git_files(opts)
--   else
--     require"telescope.builtin".find_files(opts)
--   end
-- end

telescope.load_extension("undo")
telescope.load_extension("live_grep_args")
