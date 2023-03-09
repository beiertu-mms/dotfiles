--------------------------------------------------------------------------------
-- Autocommand functions
--------------------------------------------------------------------------------
-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Remove trailing whitespaces on save.
autocmd('BufWritePre', {
  pattern = { '*.lua', '*.json', '*.json5', '*.xml' },
  command = [[%s/\s\+$//e]],
})

-- Automatically jump to the last cursor position in a previously opened buffer.
autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o',
})

-- Enable spelling check for file types
augroup('enableSpell', { clear = true })
autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'enableSpell',
  pattern = { '*.md', '*.txt' },
  command = 'setlocal spell spelllang=en_us',
})
