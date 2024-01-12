require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_x = {
      require('lsp-progress').progress,
      'encoding',
      'fileformat',
      'filetype',
    }
  }
}
