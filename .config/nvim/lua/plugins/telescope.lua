return {
  'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
  cmd = 'Telescope',
  keys = {
    { '<C-s>', '<cmd>Telescope buffers<cr>', desc = 'Open files in buffers' },
    {
      '<C-n>',
      function()
        local opts = {}
        vim.fn.system('git rev-parse --is-inside-work-tree')
        if vim.v.shell_error == 0 then
          require('telescope.builtin').git_files(opts)
        else
          require('telescope.builtin').find_files(opts)
        end
      end,
    },
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
      selection_caret = '▶ ',
      path_display = { 'smart' },
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
        previewer = false,
        layout_config = {
          height = 0.50,
          width = 0.80,
        },
        find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
      },
      git_files = {
        theme = 'dropdown',
        previewer = false,
        layout_config = {
          height = 0.50,
          width = 0.80,
        },
        find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
      },
      buffers = {
        theme = 'dropdown',
        previewer = false,
        layout_config = {
          height = 0.50,
          width = 0.80,
        },
      },
    },
    extensions = {},
  },
}
