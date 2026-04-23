require('blink.cmp').setup({
  keymap = { preset = 'default' },
  completion = {
    list = { selection = { preselect = false, auto_insert = false } },
    menu = { auto_show = true },
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  cmdline = { keymap = { preset = 'cmdline' } },
  signature = { enabled = true },
})
