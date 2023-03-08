return {
  'ldelossa/gh.nvim', -- https://github.com/ldelossa/gh.nvim
  dependencies = {
    { 'ldelossa/litee.nvim' }, -- https://github.com/ldelossa/litee.nvim
  },
  cmd = 'GHOpenPR',
  config = function()
    require('litee.lib').setup()
    require('litee.gh').setup()
  end,
}
