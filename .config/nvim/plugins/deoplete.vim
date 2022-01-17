Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#enable_at_startup = 1

augroup DeopleteOverrides
  autocmd!
  autocmd User PlugLoaded ++nested call deoplete#custom#option('omni_patterns', {
    \ 'go': '[^. *\t]\.\w*',
  \})
augroup end

