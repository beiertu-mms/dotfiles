return {
  'kylechui/nvim-surround', -- https://github.com/kylechui/nvim-surround
  version = '^3.0.0',
  event = 'VeryLazy',
  opts = {
    keymaps = {
      normal = 'sa',
      delete = 'sd',
      change = 'sr',
    },
  },
}
