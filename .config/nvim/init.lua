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
}

require('lazy').setup('plugins', lazy_config)

--------------------------------------------------------------------------------
-- Settings
-- Options: http://vimdoc.sourceforge.net/htmldoc/options.html
--------------------------------------------------------------------------------
local set = vim.opt

set.number = true
set.relativenumber = true

set.list = true
set.listchars = { eol = '↲', tab = '▸ ', trail = '·', space = '·' }

set.updatetime = 100
set.completeopt:append('menu,menuone,noselect')

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smarttab = true

set.laststatus = 2

set.autoread = true

set.wildmenu = true
set.wildignore:append('*.o,*~,*.pyc,*/out/,*/build/,*/target/')

set.swapfile = false
set.backup = false
set.undodir = os.getenv('XDG_DATA_HOME') .. '/nvim/undodir'
set.undofile = true

set.ruler = true
set.cursorline = true

set.ignorecase = true
set.smartcase = true

set.hlsearch = true
set.incsearch = true

set.termguicolors = true

set.scrolloff = 10
set.signcolumn = 'yes'
set.isfname:append('@-@')

set.lazyredraw = true

set.magic = true

set.showmatch = true

set.errorbells = false
set.visualbell = false
set.tm = 500

set.ffs = 'unix,dos,mac'

set.linebreak = true
set.textwidth = 200

set.autoindent = true
set.smartindent = true
set.wrap = true

set.fileformat = 'unix'

set.ttimeout = true
set.ttimeoutlen = 20
set.timeout = false

set.showcmd = true
set.showmode = false
set.autowrite = true
set.path = '.,**'
set.shell = '/bin/zsh'
set.ttyfast = true

set.splitbelow = true
set.splitright = true

--------------------------------------------------------------------------------
-- Remaps
--------------------------------------------------------------------------------
-- Open vim file explorer Netrw
vim.keymap.set('n', '<leader>n', ':Explore<CR>')

-- Move selections
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor at the current position when merging lines
vim.keymap.set('n', 'J', 'mzJ`z')
-- Keep cursor at the middle when doing half-page jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Keep searched term to stay in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Preserve copied buffer when pasting it over another text
vim.keymap.set('v', '<leader>p', [["_dP]])

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Delete to void register
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Keep escape consistence
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Prevent entering Ex-mode by accident
vim.keymap.set('n', 'Q', '<nop>')

-- Switch between tmux session
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Format current file
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Navigate the quickfix list
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Replace current highlighted text
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>')

-- Moving between splits with Ctrl + vim keys
vim.keymap.set('', '<C-j>', '<C-W>j')
vim.keymap.set('', '<C-k>', '<C-W>k')
vim.keymap.set('', '<C-h>', '<C-W>h')
vim.keymap.set('', '<C-l>', '<C-W>l')

-- Disable arrow keys
vim.keymap.set('', '<Up>', '<NOP>')
vim.keymap.set('', '<Down>', '<NOP>')
vim.keymap.set('', '<Left>', '<NOP>')
vim.keymap.set('', '<Right>', '<NOP>')

-- Open help in full window with 'H'
vim.cmd([[ command! -nargs=1 -complete=help H h <args> | only ]])

--------------------------------------------------------------------------------
-- Netrw, the vim explorer's configurations
--------------------------------------------------------------------------------
vim.g.netrw_keepdir = 0 -- Avoid error when moving files
vim.g.netrw_localcopydircmd = 'cp -r' -- Enable recursive copying
vim.g.netrw_winsize = 30

--------------------------------------------------------------------------------
-- Misc
--------------------------------------------------------------------------------
--[[
-- Remove trailing whitespaces on save.
--]]
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.lua', '*.json', '*.json5', '*.xml' },
  command = [[%s/\s\+$//e]],
})

--[[
-- Automatically jump to the last cursor position in a previously opened buffer.
--]]
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
