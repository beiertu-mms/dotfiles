Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
        \ 'cmdlineTimeout': 3000,
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

set guifont=JetBrains_Mono:h14
if exists('g:started_by_firenvim')
    set laststatus=0 lines=25
else
    set laststatus=2
endif

let g:dont_write = v:false
function! My_Write(timer) abort
    let g:dont_write = v:false
    write
endfunction

function! Delay_My_Write() abort
    if g:dont_write
        return
    end
    let g:dont_write = v:true
    call timer_start(10000, 'My_Write')
endfunction

au TextChanged * ++nested call Delay_My_Write()
au TextChangedI * ++nested call Delay_My_Write()

