"           _   _         __     ___
"          | \ | | ___  __\ \   / (_)_ __ ___
"          |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
"          | |\  |  __/ (_) \ V / | | | | | | |
"          |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
" Neovim documentation https://neovim.io/doc/user/vim_diff.html
" Vim options: http://vimdoc.sourceforge.net/htmldoc/options.html
"==============================================================================

" Plugins Manager
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-clang'
  Plug 'zchee/deoplete-go'

  Plug 'udalov/kotlin-vim'
  Plug 'fatih/vim-go'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'retrohacker/asciidoc.vim'
  Plug 'cespare/vim-toml'
  
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'yggdroot/indentline'
  Plug 'mhinz/vim-signify'

  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

set termguicolors
lua require'colorizer'.setup()

" Plugins Settings
let mapleader=","

let g:deoplete#enable_at_startup=1

let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo='priority'
let g:deoplete#sources#clang#include_default_arguments='True'

let g:airline_powerline_fonts=1
let g:airline_theme='ayu_mirage'

let g:go_fold_enable = []
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" vim signify
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir': '(out|build|target)',
  \ }
"==============================================================================
" Settings
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

