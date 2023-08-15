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
      { desc = 'Find files' },
    },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
      { desc = '[/] Fuzzily search in current buffer' },
    },
    { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = '[S]earch by [G]rep' },
    { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = '[S]earch [H]elp' },
    { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[S]earch current [W]ord' },
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
