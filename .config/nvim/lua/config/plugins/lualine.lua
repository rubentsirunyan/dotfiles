require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = "gruvbox-material",
    component_separators = '|',
    section_separators = '',
    always_show_tabline = false,
  },
  sections = {
    lualine_c = {},
    lualine_x = {
      function() return vim.lsp.status() end,
      'encoding',
      'fileformat',
      'filetype',
    },
  },
  winbar = {
    lualine_a = {
      { 'filetype',
        icon_only = true,
        colored = true,
        padding = {
          left = 1,
          right = 0
        }
      },
      {
        'filename',
        path = 1,
        file_status = true,
        symbols = {
          modified = '●',
          readonly = '🔒',
          unnamed = '[No Name]',
          newfile = '[New]',
        },
      },
    },
  },
  inactive_winbar = {
    lualine_c = {
      { 'filetype',
        icon_only = true,
        colored = true,
        padding = {
          left = 1,
          right = 0
        }
      },
      {
        'filename',
        path = 0,
        file_status = true,
        symbols = {
          modified = '●',
          readonly = '🔒',
          unnamed = '[No Name]',
          newfile = '[New]',
        },
      },
    },
  },
})
