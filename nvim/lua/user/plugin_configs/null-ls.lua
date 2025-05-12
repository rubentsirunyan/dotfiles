local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		require("none-ls.formatting.ruff"),

		-- JavaScript
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),

		-- Python
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		-- diagnostics.ruff,

		-- Lua
		formatting.stylua.with({
			extra_args = { "--quote-style", "ForceDouble" },
		}),

		-- Github Actions
		diagnostics.actionlint,

		-- YAML
		diagnostics.yamllint,
		formatting.yamlfmt,

		-- Terraform
		formatting.terraform_fmt,

		-- Bash
		formatting.shfmt,

		-- Go
		formatting.gofmt,
		formatting.goimports,
	},
})

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
	return
end

mason_null_ls.setup({
	-- ensure_installed = nil, -- Set this table to nil, to make sure the source of truth is the sources defined above
	ensure_installed = { "ruff" }, -- For some reason ruff is not automatically installed so had to add this. Will fix later.
	automatic_installation = true,
})
