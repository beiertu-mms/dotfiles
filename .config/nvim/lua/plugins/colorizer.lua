return {
  'norcalli/nvim-colorizer.lua', -- https://github.com/norcalli/nvim-colorizer.lua
  config = function()
    local colorizer = require('colorizer')

    colorizer.setup({
      css = { css = true },
      html = { names = false },
    })
  end,
}
