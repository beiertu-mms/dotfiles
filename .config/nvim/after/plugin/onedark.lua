--[[
-- https://github.com/navarasu/onedark.nvim
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
--]]

--[[
-- https://github.com/joshdick/onedark.vim
--]]
vim.cmd([[
try
  colorscheme onedark
  hi Normal guibg=NONE ctermbg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
