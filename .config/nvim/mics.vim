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
