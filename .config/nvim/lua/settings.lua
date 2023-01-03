--[[
-- Options: http://vimdoc.sourceforge.net/htmldoc/options.html
--]]
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
