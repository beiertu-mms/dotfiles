Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

nnoremap <C-p> :FZF<CR>
nnoremap <C-n> :GFiles<CR>
nnoremap <C-s> :Buffers<CR>

