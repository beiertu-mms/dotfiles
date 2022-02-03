require('functions')

vim.g.mapleader=' '
vim.g.maplocalleader=','

nmap("<leader>s", ":luafile %<CR>")

-- Moving between splits with Ctrl + vim keys
map("", "<C-j>", "<C-W>j")
map("", "<C-k>", "<C-W>k")
map("", "<C-h>", "<C-W>h")
map("", "<C-l>", "<C-W>l")

-- Disable arrow keys
map("", "<Up>", "<NOP>")
map("", "<Down>", "<NOP>")
map("", "<Left>", "<NOP>")
map("", "<Right>", "<NOP>")

-- Find files using Telescope command-line sugar.
--map("", "C-n", ":Telescope find_files<CR>")
--map("", "C-s", ":Telescope buffers<CR>")

vim.cmd([[
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fg :Telescope git_files<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
]])
