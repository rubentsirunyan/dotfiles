require('noice').setup({
	messages = {
		enabled = true,
	},
	views = {
		notify = {
			replace = true,
		},
	},
	lsp = {
		progress = {
			enabled = true,
			format = "lsp_progress",
			format_done = "lsp_progress_done",
			-- throttle = 1000 / 30,
			view = "notify",
		},
		-- override markdown rendering so that **cmp** and other plugins use **treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
})
