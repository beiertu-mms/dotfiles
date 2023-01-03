--[[
-- https://github.com/jghauser/mkdir.nvim
--]]
local status_ok, _ = pcall(require, 'mkdir')
if not status_ok then
  print('mkdir is not installed')
  return
end
