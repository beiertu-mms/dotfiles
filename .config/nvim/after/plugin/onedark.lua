--[[
-- https://github.com/RRethy/nvim-base16
--]]
local status_ok, _ = pcall(require, 'base16-colorscheme')
if not status_ok then
  print('base16-colorscheme is not installed')
  return
end

vim.cmd('colorscheme base16-onedark')
