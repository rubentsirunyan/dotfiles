local lint = require('lint')

lint.linters_by_ft = {
  yaml = { 'yamllint' },
  ['yaml.github'] = { 'actionlint' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
  callback = function(args)
    -- Skip non-file buffers (telescope previews, terminal, prompt, etc.) so we
    -- don't spawn linters on transient buffers.
    if vim.bo[args.buf].buftype ~= '' then return end
    require('lint').try_lint()
  end,
})
