local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    -- disable = function(lang, bufnr)
    --     if vim.bo.filetype == 'help' then
    --         return true
    --     elseif vim.bo.filetype == 'lua' then
    --         return true
    --     else
    --         return false
    --     end
    -- end,
    -- additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}


local context = require("treesitter-context")
context.setup {
  enable = true
}
