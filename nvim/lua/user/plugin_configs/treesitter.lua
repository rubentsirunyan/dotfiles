local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = function(lang, bufnr)
        if vim.bo.filetype == 'help' then
            return true
        elseif vim.bo.filetype == 'lua' then
            return true
        else
            return false
        end
    end,

  },
  indent = { enable = true, disable = { "yaml" } },

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aB"] = "@block.outer",
        ["iB"] = "@block.inner",
      },
      include_surrounding_whitespace = true,
    },
  },
}


local context = require("treesitter-context")
context.setup {
  enable = true
}
