--[[
-- https://github.com/navarasu/onedark.nvim
--]]
local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	print("onedark color scheme is not installed")
	return
end

onedark.setup({
	style = "dark",
	ending_tildes = true,
})
onedark.load()
