--
-- https://github.com/joshdick/onedark.vim
--
vim.cmd([[
try
  colorscheme onedark
  hi Normal guibg=NONE ctermbg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
