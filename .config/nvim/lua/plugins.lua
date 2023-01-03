--[[
-- See https://github.com/wbthomason/packer.nvim#quickstart
--]]
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Start using Packer
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  print('packer is not installed')
  return
end

return packer.startup(function(use)
  use('wbthomason/packer.nvim')

  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  })

  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  })

  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  })

  use({
    'navarasu/onedark.nvim',
    'lewis6991/gitsigns.nvim',
    'numToStr/Comment.nvim',
    'jghauser/mkdir.nvim',
    'windwp/nvim-autopairs',
    'lukas-reineke/indent-blankline.nvim',
    'norcalli/nvim-colorizer.lua',
    'b0o/schemastore.nvim',
  })

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
