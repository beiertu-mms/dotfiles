" ++++++++++++++++++++++++++
" |     NeoVim Plugins     |
" ++++++++++++++++++++++++++
"
" Copyright (c) 2021-present Tung Beier
" License: MIT

" auto-install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
  " Auto completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-clang'
  Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
  " Plug 'zchee/deoplete-go'
  " Plug 'zchee/nvim-go', { 'do': 'make'}
  "
  " Golang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'ctrlpvim/ctrlp.vim'

  " Plug 'udalov/kotlin-vim'
  " Plug 'retrohacker/asciidoc.vim'
  " Plug 'cespare/vim-toml'
  
  Plug 'jiangmiao/auto-pairs'

  " Theme
  Plug 'joshdick/onedark.vim'

  " Statusline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " UI
  Plug 'airblade/vim-gitgutter'
  Plug 'yggdroot/indentline'
  Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

" Settings
set termguicolors
set updatetime=100

lua require'colorizer'.setup()

" Deoplete
let g:deoplete#enable_at_startup=1

" Deoplete Clang
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo='priority'
let g:deoplete#sources#clang#include_default_arguments='True'

" Golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:deoplete#sources#go#gocode_binary = "$GOPATH/bin/gocode"
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#cgo = 1

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
let g:signify_sign_add='+'
let g:signify_sign_delete='_'
let g:signify_sign_delete_first_line='‾'
let g:signify_sign_change='~'
let g:signify_sign_show_count=0
let g:signify_sign_show_text=1

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir': '(out|build|target)',
  \ }

