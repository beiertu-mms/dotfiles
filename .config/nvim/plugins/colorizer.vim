Plug 'norcalli/nvim-colorizer.lua'

augroup ColorizerOverrides
  autocmd!
  autocmd User PlugLoaded ++nested set termguicolors
  autocmd User PlugLoaded ++nested lua require'colorizer'.setup()
augroup end

