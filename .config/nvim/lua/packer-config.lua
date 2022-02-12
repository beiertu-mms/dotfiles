-- See https://github.com/wbthomason/packer.nvim#quickstart
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-config.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- language server protocol
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
		"tamago324/nlsp-settings.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
	})

	-- snippets
	use({
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	})

	use({
		"joshdick/onedark.vim",
		"jghauser/mkdir.nvim",
		"lewis6991/gitsigns.nvim",
		"windwp/nvim-autopairs",
		"lukas-reineke/indent-blankline.nvim",
		"norcalli/nvim-colorizer.lua",
		"kyazdani42/nvim-tree.lua",
	})

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
