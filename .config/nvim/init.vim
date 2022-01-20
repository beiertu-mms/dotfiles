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
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
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
" GENERAL
"==============================================================================
source ~/.config/nvim/general.vim

"==============================================================================
" KEY MAPPINGS
"==============================================================================
source ~/.config/nvim/keys.vim

"==============================================================================
" MISCELLANEOUS
"==============================================================================
source ~/.config/nvim/mics.vim

