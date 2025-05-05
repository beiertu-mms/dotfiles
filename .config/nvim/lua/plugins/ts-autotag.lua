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
  opts = {
    enable_close_on_slash = true,
  },
}
