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

-- Setup lazy.nvim - https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Leader key must be set before lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Setup lazy.nvim
require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },

  -- disable LuaRocks (lua package manager because currently none of the installed plugins require it)
  rocks = {
    enabled = false,
  },

  -- automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false,
    frequency = 7200, -- check every 2 hour
  },

  -- automatically check for config file changes and reload the ui
  change_detection = {
    enabled = true,
    notify = false,
  },
})

-- Setup core functionalities
require('core.options')
require('core.keymaps')
require('core.autocmds')
