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
" auto-install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

let g:polyglot_disabled = ['markdown']

"==============================================================================
" Plugins
call plug#begin('~/.local/share/nvim/plugged')
  " Auto completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Golang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'

  " Theme
  Plug 'joshdick/onedark.vim'

  " Statusline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " UI
  Plug 'airblade/vim-gitgutter'
  Plug 'yggdroot/indentline'
  Plug 'norcalli/nvim-colorizer.lua'

  " Syntax highlighting
  Plug 'sheerun/vim-polyglot'
call plug#end()

" Settings
set termguicolors
set updatetime=100

lua require'colorizer'.setup()

" Deoplete
let g:deoplete#enable_at_startup=1

" Golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='ayu_mirage'

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir': '(out|build|target)',
  \ }

"==============================================================================
"
let mapleader=","

colorscheme onedark
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
" :au FocusLost * :wa

set splitbelow splitright

set updatetime=100

set laststatus=2

"==============================================================================
" Key maps
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
" Functions
" ag - the silver searcher
if executable('ag')
  " Prefer over vim grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m

  " Use ag in CtrlP
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching=0
endif

" Delete trailing white spaces on save
function! DeleteTrailingWhiteSpaces()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

" autocmd BufWrite *.py, *.java, *.h, *.cpp, *.js, *.kt :call DeleteTrailingWhiteSpaces()
command! FixWhitespaces call DeleteTrailingWhiteSpaces()

" Write file with higher permission
command! W w !sudo tee "%" > /dev/null

" CtrlP and ctags
nnoremap <leader>t ::CtrlPTag<cr>

