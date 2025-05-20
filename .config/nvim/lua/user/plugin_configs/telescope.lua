local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	hidden = true,
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
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
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		projects = {},
		-- harpoon = {},
		file_browser = {
			theme = "dropdown",
			previewer = false,
			hidden = true,
			cwd_to_path = true,
			auto_depth = true,
			hijack_netrw = false, -- disables netrw and use telescope-file-browser in its place
			mappings = {
				["i"] = {
					["<C-h>"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
					["<C-l>"] = require("telescope.actions").select_default,
				},
				["n"] = {
					h = require("telescope").extensions.file_browser.actions.goto_parent_dir,
					l = require("telescope.actions").select_default,
				},
			},
		},
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			additional_args = function()
        return {
          "--hidden",             -- include dotfiles
          "--no-ignore",          -- skip .gitignore / .ignore
          "--glob", "!.git/*",    -- still hide the .git folder itself
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

telescope.load_extension("media_files")
-- telescope.load_extension('project')
telescope.load_extension("projects")
telescope.load_extension("file_browser")
telescope.load_extension("undo")
-- telescope.load_extension('harpoon')
telescope.load_extension("macros")
telescope.load_extension("live_grep_args")
