return {
  'windwp/nvim-autopairs', -- https://github.com/windwp/nvim-autopairs
  event = 'InsertEnter',
  opts = {
    disable_in_macro = true, -- disable when recording or executing a macro
    disable_in_visualblock = true, -- disable when insert after visual block mode
    check_ts = true, -- enable with treesitter
    fast_wrap = {
      map = '<M-e>',
      highlight = 'PmenuSel',
      highlight_grey = 'LineNr',
    },
  },
  config = true,
}
