--[[
-- https://github.com/norcalli/nvim-colorizer.lua
--]]
local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	print("colorizer is not installed")
	return
end

colorizer.setup()
