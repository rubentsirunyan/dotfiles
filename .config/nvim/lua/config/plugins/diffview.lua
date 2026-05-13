require('diffview').setup({
  enhanced_diff_hl = true,
  view = {
    default = {
      winbar_info = true,
    },
    merge_tool = {
      layout = 'diff4_mixed',
      disable_diagnostics = true,
      winbar_info = true,
    },
    file_history = {
      winbar_info = true,
    },
  },
})
