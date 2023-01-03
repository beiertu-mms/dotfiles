--[[
-- Remove trailing whitespaces on save.
--]]
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.lua', '*.json', '*.json5', '*.xml' },
  command = [[%s/\s\+$//e]],
})

--[[
-- Replace multiple blank lines with just one on save.
--]]
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*' },
  command = [[%s/\(\n\n\)\n\+/\1/]],
})

--[[
-- Automatically jump to the last cursor position in a previously opened buffer.
--]]
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
