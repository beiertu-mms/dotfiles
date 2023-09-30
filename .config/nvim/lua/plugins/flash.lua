return {
  -- https://github.com/folke/flash.nvim
  'folke/flash.nvim',
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
  config = function()
    -- Match beginning of words only
    require('flash').jump({
      search = {
        mode = function(str)
          return '\\<' .. str
        end,
      },
    })
  end,
}
