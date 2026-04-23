local M = {}

function M.add_missing_imports()
  local left_win = vim.fn.win_getid(vim.fn.winnr('h'))
  local right_win = vim.fn.win_getid(vim.fn.winnr('l'))

  local left_buf = vim.api.nvim_win_get_buf(left_win)
  local right_buf = vim.api.nvim_win_get_buf(right_win)

  local left_lines = vim.api.nvim_buf_get_lines(left_buf, 0, -1, false)
  local right_lines = vim.api.nvim_buf_get_lines(right_buf, 0, -1, false)

  local function line_exists_in_left(line)
    local pattern = 'to%s*=%s*' .. vim.pesc(line)
    for _, l in ipairs(left_lines) do
      if l:match(pattern) then
        return true
      end
    end
    return false
  end

  local new_lines = {}
  for _, rline in ipairs(right_lines) do
    if not line_exists_in_left(rline) then
      table.insert(new_lines, 'import {')
      table.insert(new_lines, '  to = ' .. rline)
      table.insert(new_lines, '  id = ""')
      table.insert(new_lines, '}')
    end
  end

  if #new_lines > 0 then
    vim.api.nvim_buf_set_lines(left_buf, -1, -1, false, new_lines)
    print('Added ' .. #new_lines / 4 .. ' new import blocks.')
  else
    print('No missing imports found.')
  end
end

return M
