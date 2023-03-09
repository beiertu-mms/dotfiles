--------------------------------------------------------------------------------
-- Key mappings for default Neovim
--------------------------------------------------------------------------------
-- Open vim file explorer Netrw
vim.keymap.set('n', '<leader>n', ':Explore<CR>')

-- Move selections
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor at the current position when merging lines
vim.keymap.set('n', 'J', 'mzJ`z')
-- Keep cursor at the middle when doing half-page jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Keep searched term to stay in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Preserve copied buffer when pasting it over another text
vim.keymap.set('v', '<leader>p', [["_dP]])

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Delete to void register
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Keep escape consistence
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Prevent entering Ex-mode by accident
vim.keymap.set('n', 'Q', '<nop>')

-- Switch between tmux session
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Format current file
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Navigate the quickfix list
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Replace current highlighted text
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>')

-- Moving between splits with Ctrl + vim keys
vim.keymap.set('', '<C-j>', '<C-W>j')
vim.keymap.set('', '<C-k>', '<C-W>k')
vim.keymap.set('', '<C-h>', '<C-W>h')
vim.keymap.set('', '<C-l>', '<C-W>l')

-- Disable arrow keys
vim.keymap.set('', '<Up>', '<NOP>')
vim.keymap.set('', '<Down>', '<NOP>')
vim.keymap.set('', '<Left>', '<NOP>')
vim.keymap.set('', '<Right>', '<NOP>')

-- Open help in full window with 'H'
vim.cmd([[ command! -nargs=1 -complete=help H h <args> | only ]])
