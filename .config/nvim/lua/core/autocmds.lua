--------------------------------------------------------------------------------
-- Autocommand functions
-- See also: h:api-autocmd, h:augroup
--------------------------------------------------------------------------------
local function augroup(name)
  return vim.api.nvim_create_augroup('core_custom_' .. name, { clear = true })
end

-- Remove trailing whitespaces on save.
vim.api.nvim_create_autocmd('BufWritePre', {
  group = augroup('remove_trailing_whitespaces'),
  pattern = { 'lua', 'json', 'json5', 'xml', 'yaml' },
  command = [[%s/\s\+$//e]],
})

-- Automatically jump to the last cursor position in a previously opened buffer.
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup('go_to_last_location'),
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'gitcommit' then
      return
    end

    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Don't auto commenting new lines
vim.api.nvim_create_autocmd('BufEnter', {
  group = augroup('disable_auto_line_commenting'),
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o',
})

-- Change indentation for file types
-- Enable spelling check for file types
vim.api.nvim_create_autocmd('FileType', {
  group = augroup('decrease_indent_and_enable_wrap_and_spell'),
  pattern = { 'gitcommit', 'markdown', 'json', 'text', 'yaml' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2

    if vim.bo.filetype ~= 'json' and vim.bo.filetype ~= 'yaml' then
      vim.opt_local.wrap = true
      vim.opt_local.spell = true
      vim.opt_local.spelllang = { 'en_us', 'de_de' }
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = augroup('auto_create_dir'),
  callback = function(event)
    if event.match:match('^%w%w+://') then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})
