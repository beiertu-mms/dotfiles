-- https://github.com/nvim-treesitter/nvim-treesitter
local status_ok, treesitter_conf = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter_conf.setup({
	ensure_installed = "maintained", -- One of "all", "maintained" (parsers with maintainers), or a list of languages

	sync_install = false, -- Install languages synchronously (only applied to `ensure_installed`)

	ignore_install = { "" }, -- List of parsers to ignore installing

	highlight = {
		enable = true, -- `false` will disable the whole extension
		disable = {}, -- list of language that will be disabled
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
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
