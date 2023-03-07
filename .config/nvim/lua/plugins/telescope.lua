return {
  'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
  cmd = 'Telescope',
  keys = {
    { '<C-p>', '<cmd>Telescope find_files<cr>', desc = 'Find all files' },
    { '<C-n>', '<cmd>Telescope git_files<cr>', desc = 'Find files tracked by Git' },
    { '<C-s>', '<cmd>Telescope buffers<cr>', desc = 'Open files in buffers' },
    --[[
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input('Grep > ') })
    end)
--]]
  },
  dependencies = { 'nvim-lua/plenary.nvim', lazy = true },
  opts = {
    defaults = {
      prompt_prefix = '  ',
      selection_caret = ' ',
      path_display = { 'smart' },
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
        previewer = false,
        layout_config = {
          height = 0.25,
          width = 0.85,
        },
      },
      git_files = {
        theme = 'dropdown',
        previewer = false,
        layout_config = {
          height = 0.25,
          width = 0.85,
        },
      },
      buffers = {
        theme = 'dropdown',
        previewer = false,
        layout_config = {
          height = 0.25,
          width = 0.85,
        },
      },
    },
    extensions = {},
  },
}
