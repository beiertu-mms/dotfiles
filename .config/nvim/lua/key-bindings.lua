local map = function(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local nmap = function(shortcut, command)
	map("n", shortcut, command)
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","

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
nmap("<C-n>", ":Telescope find_files<CR>")
nmap("<C-s>", ":Telescope buffers<CR>")
nmap("<C-p>", ":Telescope git_files<CR>")
nmap("<leader>fh", ":Telescope help_tags<CR>")
