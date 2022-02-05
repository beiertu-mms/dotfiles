local fn = vim.fn

-- See https://github.com/wbthomason/packer.nvim#quickstart
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'joshdick/onedark.vim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- language server protocol
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'tamago324/nlsp-settings.nvim',
  }

  -- completion
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
  }

  -- snippets
  use {
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  }

  use 'jghauser/mkdir.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'windwp/nvim-autopairs'

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
