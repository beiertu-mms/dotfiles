-- https://github.com/nvim-lualine/lualine.nvim
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local filetype = {
	"filetype",
	colored = true, -- Displays filetype icon in color if set to true
	icon_only = false, -- Display only an icon for filetype
}

local filename = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	path = 1, -- 0: Just the filename, 1: Relative path, 2: Absolute path
	shorting_target = 50, -- Shortens path to leave 50 spaces in the window
	symbols = {
		modified = " ",
		readonly = " ",
		unnamed = "No-Name",
	},
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "wombat",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { filename },
		lualine_c = { "diagnostics" },

		lualine_x = { "diff", "encoding", "fileformat" },
		lualine_y = { "branch", "progress", filetype },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
