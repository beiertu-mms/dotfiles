return {
  'windwp/nvim-ts-autotag', -- https://github.com/windwp/nvim-ts-autotag
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  ft = {
    'html',
    'markdown',
    'xml',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      autotag = {
        enable = true,
      },
    })
  end,
}
