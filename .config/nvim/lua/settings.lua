--[[
-- Settings
-- Vim options: http://vimdoc.sourceforge.net/htmldoc/options.html
--]]
local set = vim.opt

set.relativenumber = true
set.numberwidth = 5

set.list = true
set.listchars = { eol = "↲", tab = "▸ ", trail = "·", space = "⋅" }

set.updatetime = 100
set.completeopt:append("menu,menuone,noselect")

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2

set.laststatus = 2

set.autoread = true

set.clipboard:append("unnamed")
set.clipboard:append("unnamedplus")

set.wildmenu = true
set.wildignore:append("*.o,*~,*.pyc,*/out/,*/build/,*/target/")

set.ruler = true

set.ignorecase = true
set.smartcase = true

set.incsearch = true
set.hlsearch = true

set.lazyredraw = true

set.magic = true

set.showmatch = true

set.errorbells = false
set.visualbell = false
set.tm = 500

set.ffs = "unix,dos,mac"

set.backup = false
set.writebackup = false
set.swapfile = false

set.linebreak = true
set.textwidth = 120

set.autoindent = true
set.smartindent = true
set.wrap = true

set.fileformat = "unix"

set.ttimeout = true
set.ttimeoutlen = 20
set.timeout = false

set.showcmd = true
set.showmode = false
set.autowrite = true
set.path = ".,**"
set.shell = "/bin/zsh"
set.ttyfast = true

set.splitbelow = true
set.splitright = true

--vim.cmd([[
--set t_vb=
--hi Normal guibg=NONE ctermbg=NONE
--]])
--vim.cmd("set t_vb=")
set.termguicolors = true
--[[

hi Normal guibg=NONE ctermbg=NONE

hi DiffAdd      ctermfg=Green         ctermbg=NONE
hi DiffChange   ctermfg=NONE          ctermbg=NONE
hi DiffDelete   ctermfg=Red           ctermbg=NONE
hi DiffText     ctermfg=Yellow        ctermbg=NONE

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

au BufRead,BufNewFile zathurarc set ft=config
au FileType vim,yml,yaml,toml,json setlocal sw=2 ts=2 sts=2
au FileType cpp setlocal noexpandtab
au FileType go setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
--]]