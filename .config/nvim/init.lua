--[[
--                        _             _       _ _     _
--  _ __   ___  _____   _(_)_ __ ___   (_)_ __ (_) |_  | |_   _  __ _
-- | '_ \ / _ \/ _ \ \ / / | '_ ` _ \  | | '_ \| | __| | | | | |/ _` |
-- | | | |  __/ (_) \ V /| | | | | | | | | | | | | |_ _| | |_| | (_| |
-- |_| |_|\___|\___/ \_/ |_|_| |_| |_| |_|_| |_|_|\__(_)_|\__,_|\__,_|
--
-- Copyright (c) 2021-present Tung Beier
-- License: MIT
--
-- Neovim documentation https://neovim.io/doc/user/vim_diff.html
-- Vim options: http://vimdoc.sourceforge.net/htmldoc/options.html
--]]

require('settings')
require('keys-binding')
require('packer-config')
require('lsp-config')
require('plugins.onedark')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.treesitter')

--[[
-- TODO:
-- [ ] LSP nvim-lspconfig + nvim-lspinstall + lspsaga.nvim
-- [ ] nvim-compe for completion / deoplete
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

