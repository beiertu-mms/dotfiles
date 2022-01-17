"           _   _         __     ___
"          | \ | | ___  __\ \   / (_)_ __ ___
"          |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
"          | |\  |  __/ (_) \ V / | | | | | | |
"          |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
" Copyright (c) 2021-present Tung Beier
" License: MIT
"
" Neovim documentation https://neovim.io/doc/user/vim_diff.html
" Vim options: http://vimdoc.sourceforge.net/htmldoc/options.html

"==============================================================================
" PLUGINS
"==============================================================================
" auto-install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
  source ~/.config/nvim/plugins/airline.vim
  source ~/.config/nvim/plugins/auto-pairs.vim
  source ~/.config/nvim/plugins/colorizer.vim
  source ~/.config/nvim/plugins/deoplete.vim
  source ~/.config/nvim/plugins/firenvim.vim
  source ~/.config/nvim/plugins/fzf.vim
  source ~/.config/nvim/plugins/gitgutter.vim
  source ~/.config/nvim/plugins/go.vim
  source ~/.config/nvim/plugins/indentline.vim
  source ~/.config/nvim/plugins/netrw.vim
  source ~/.config/nvim/plugins/onedark.vim
  source ~/.config/nvim/plugins/polyglot.vim
  source ~/.config/nvim/plugins/surround.vim
call plug#end()
doautocmd User PlugLoaded

"==============================================================================
" SETTINGS
"==============================================================================

set updatetime=100
set completeopt+=noselect

hi Normal guibg=NONE ctermbg=NONE

hi DiffAdd      ctermfg=Green         ctermbg=NONE
hi DiffChange   ctermfg=NONE          ctermbg=NONE
hi DiffDelete   ctermfg=Red           ctermbg=NONE
hi DiffText     ctermfg=Yellow        ctermbg=NONE

" Save undo history
set undofile

" Line numbers
set number relativenumber
set numberwidth=5
:au VimEnter,InsertLeave * :set relativenumber
":au InsertEnter * :set norelativenumber

" Chars
set list
set listchars=tab:▸\ ,eol:¬,nbsp:+

" Spell checking
  " set spelllang=en_us,de_de
  " set spell

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

au BufRead,BufNewFile zathurarc set ft=config
au FileType vim,yml,yaml,toml,json setlocal sw=2 ts=2 sts=2
au FileType cpp setlocal noexpandtab
au FileType go setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

" Auto reload file when it is changed outside
set autoread

set clipboard=unnamed
set clipboard=unnamedplus

set wildmenu
set wildignore+=*.o,*~,*.pyc,*/out/,*/build/,*/target/

set ruler

set ignorecase
set smartcase

set incsearch
set hlsearch

set lazyredraw

" Turn on magic for regex
set magic

set showmatch

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set ffs=unix,dos,mac

set nobackup
set nowritebackup
set noswapfile

set linebreak
set textwidth=120

set autoindent
set smartindent
set wrap

set fileformat=unix

set ttimeout
set ttimeoutlen=20
set notimeout

set showcmd
set noshowmode
set autowrite
set path+=**
set shell=/bin/zsh
set ttyfast

set splitbelow splitright

set updatetime=100

set laststatus=2

set guifont=JetBrains_Mono:h16
if exists('g:started_by_firenvim')
  set laststatus=0
else
  set laststatus=2
endif

"==============================================================================
" KEY MAPPINGS
"==============================================================================
let mapleader=","

" Moving between splits with Ctrl + vim keys
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"==============================================================================
" MISCELLANEOUS
"==============================================================================
" ag - the silver searcher
if executable('ag')
  " Prefer over vim grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

" Delete trailing white spaces on save
function! DeleteTrailingWhiteSpaces()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

" autocmd BufWrite *.py, *.java, *.h, *.cpp, *.js, *.kt :call DeleteTrailingWhiteSpaces()

