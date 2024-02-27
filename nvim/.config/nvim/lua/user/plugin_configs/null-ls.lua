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
    -- JavaScript
		formatting.prettier.with(
      { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" }
    }),

    -- Python
		formatting.black.with({
      extra_args = { "--fast" }
    }),
		diagnostics.flake8,

    -- Lua
		formatting.stylua.with({
			extra_args = { "--quote-style", "ForceDouble" },
		}),

    -- Github Actions
		diagnostics.actionlint,

    -- YAML
		diagnostics.yamllint,
		formatting.yamlfmt,

    -- JSON
		diagnostics.jsonlint,
		formatting.fixjson,

    -- Terraform
		formatting.terraform_fmt,

    -- Bash
		formatting.beautysh,

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
	automatic_installation = true,
})
