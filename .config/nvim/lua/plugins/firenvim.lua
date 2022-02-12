--
-- https://github.com/glacambre/firenvim
--
local status_ok, _ = pcall(require, "firenvim")
if not status_ok then
	return
end

vim.cmd([[
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

  set guifont=JetBrains_Mono:h12
  if exists('g:started_by_firenvim')
    set laststatus=0 lines=25
  else
    set laststatus=2
  endif
]])
