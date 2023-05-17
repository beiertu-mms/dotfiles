return {
  'nvim-neo-tree/neo-tree.nvim', -- https://github.com/nvim-neo-tree/neo-tree.nvim
  branch = 'v2.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'MunifTanjim/nui.nvim' },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  keys = {
    { '<leader>n', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },
  cmd = 'Neotree',
  config = function()
    require('neo-tree').setup({
      window = {
        width = 50,
        mappings = {
          ['z'] = 'close_all_nodes',
          ['Z'] = 'expand_all_nodes',
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = true,
          hide_gitignored = false,
        },
      },
    })
  end,
}
