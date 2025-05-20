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

-- Set terraform-vars filetype to terraform
vim.api.nvim_create_autocmd('BufEnter', {
  group = augroup('set_filetype_of_tfvars'),
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'terraform-vars' then
      vim.opt_local.filetype = 'terraform'
    end
  end,
})

-- Set filetype to helm when the file is in certain paths
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('set_filetype_of_helm'),
  pattern = { '*/templates/*.yaml', '*/templates/*.tpl', '*.gotmpl', 'helmfile*.yaml' },
  callback = function()
    vim.opt_local.filetype = 'helm'
  end,
})

-- Set filetype to sh for zsh file ending
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('set_filetype_of_shell'),
  pattern = { '*.zsh' },
  callback = function()
    vim.opt_local.filetype = 'sh'
  end,
})
