--[[
--  _   _         __     ___
-- | \ | | ___  __\ \   / (_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
-- | |\  |  __/ (_) \ V / | | | | | | |
-- |_| \_|\___|\___/ \_/  |_|_| |_| |_|
--
-- Copyright (c) 2021-present Tung Beier
-- License: MIT
--
-- Neovim documentation https://neovim.io/doc/user/vim_diff.html
--]]

require('settings')
require('key-bindings')
require('packer')
--require('language-servers')
require('plugins.onedark')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.completion')

--[[
-- TODO:
-- [ ] LSP nvim-lspconfig + nvim-lspinstall + lspsaga.nvim
-- [x] nvim-cmp for completion / deoplete
-- [x] telescope.nvim replaces any search plugins e.g. ctrl-p or fzf.vim
-- [x] https://github.com/nvim-treesitter/nvim-treesitter for file preview?
-- [ ] gitsigns replaces vim-gitgutter
-- [ ] autopair
-- [ ] colorizer
-- [ ] firenvim
-- [ ] go.vim
-- [ ] indentline
-- [ ] surround
--]]

