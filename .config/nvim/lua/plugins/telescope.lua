return {
  'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
  branch = '0.1.x',
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
        require('telescope.builtin').current_buffer_fuzzy_find()
      end,
      { desc = '[/] Fuzzily search in current buffer' },
    },
    { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = '[S]earch by [G]rep' },
    { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = '[S]earch [H]elp' },
    { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[S]earch current [W]ord' },
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      lazy = true,
    },
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        prompt_prefix = '  ',
        selection_caret = '▶ ',
        path_display = { 'smart' },
        preview = {
          hide_on_startup = true,
        },
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            height = 0.60,
            width = 0.80,
            preview_cutoff = 80,
            prompt_position = 'bottom',
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    })

    telescope.load_extension('fzf')
  end,
}
