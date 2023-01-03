--[[
-- https://github.com/lukas-reineke/indent-blankline.nvim
--]]
local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  print('indent-blankline is not installed')
  return
end

indent_blankline.setup({
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
})
