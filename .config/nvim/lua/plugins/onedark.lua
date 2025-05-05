return {
  'navarasu/onedark.nvim', -- https://github.com/navarasu/onedark.nvim
  lazy = false,
  priority = 1000,
  opts = {
    style = 'dark',
    ending_tildes = true,

    toggle_style_key = "<leader>ts",
    toggle_style_list = {'dark', 'light'},

    code_style = {
        comments = 'italic',
        functions = 'bold',
    },
  },
  init = function()
    require('onedark').load()
  end,
}
