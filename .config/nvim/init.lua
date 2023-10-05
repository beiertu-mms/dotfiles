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
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key must be set before lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazy_config = {
  checker = { -- automatically check for plugin updates
    eabled = true,
    frequency = 7200, -- check every 2 hour
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}

require('lazy').setup('plugins', lazy_config)

require('core.options')
require('core.keymaps')
require('core.autocmds')

--[[
-- Change file types to helm if a 'Chart.yaml' file is found
--]]
local isHelmfile = function(path)
  local check = vim.fs.find('Chart.yaml', { path = vim.fs.dirname(path), upward = true })
  return not vim.tbl_isempty(check)
end

vim.filetype.add({
  extension = {
    yaml = isHelmfile and 'helm' or 'yaml',
    yml = isHelmfile and 'helm' or 'yaml',
    tmpl = isHelmfile and 'helm' or 'tmpl',
    tpl = isHelmfile and 'helm' or 'tpl',
  },
  filename = {
    ['Chart.yaml'] = 'yaml',
    ['Chart.lock'] = 'yaml',
  },
})
