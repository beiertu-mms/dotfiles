--
-- https://github.com/nvim-treesitter/nvim-treesitter
--
local status_ok, treesitter_conf = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter_conf.setup({
	-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
	ensure_installed = {
		"c",
		"bash",
		"comment",
		"cpp",
		"css",
		"dockerfile",
		"go",
		"gomod",
		"gowork",
		"hcl",
		"hjson",
		"hocon",
		"html",
		"http",
		"java",
		"javascript",
		"json",
		"json5",
		"kotlin",
		"lua",
		"make",
		"python",
		"rasi",
		"regex",
		"scss",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	sync_install = false, -- Install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing

	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = true,
	},

	autopairs = {
		enable = true,
	},

	indent = {
		enable = true,
		disable = { "yaml" },
	},
})
