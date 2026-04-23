-- Custom status column layout. Pins gitsigns and diagnostic signs to fixed
-- positions so they don't swap slots when one is absent.
--
-- Column order (left to right):
--   [gitsigns sign] [fold arrow] [line number] [diagnostic sign] [code]
local builtin = require('statuscol.builtin')

require('statuscol').setup({
  relculright = true, -- relative numbers right-aligned within the number column
  segments = {
    -- Gitsigns: far left, one column wide.
    {
      sign = { namespace = { 'gitsigns' }, maxwidth = 1, colwidth = 1, auto = false },
      click = 'v:lua.ScSa',
    },
    -- Fold column: builtin.foldfunc renders open/close arrows from fillchars
    -- (foldopen/foldclose/foldsep) WITHOUT the nesting-depth digits that
    -- native '%C' emits.
    { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
    -- Line numbers.
    { text = { '%l' }, click = 'v:lua.ScLa' },
    -- Diagnostic signs: right-most, adjacent to the buffer text.
    {
      sign = { namespace = { 'diagnostic' }, maxwidth = 1, colwidth = 1, auto = false },
      click = 'v:lua.ScSa',
    },
  },
})
