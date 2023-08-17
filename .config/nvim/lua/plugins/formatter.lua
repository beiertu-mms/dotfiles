return {
  'mhartington/formatter.nvim', -- https://github.com/mhartington/formatter.nvim
  event = 'VeryLazy',
  opts = function()
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
      pattern = '*',
      command = 'FormatWrite',
    })

    return {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        go = {
          require('formatter.filetypes.go').gofmt,
        },
        json = {
          require('formatter.filetypes.json').jq,
        },
        kotlin = {
          require('formatter.filetypes.kotlin').ktlint,
        },
        lua = {
          require('formatter.filetypes.lua').stylua,
        },
        python = {
          require('formatter.filetypes.python').black,
        },
        sh = {
          require('formatter.filetypes.sh').shfmt,
        },
        terraform = {
          require('formatter.filetypes.terraform').terraformfmt,
        },
        yaml = {
          require('formatter.filetypes.yaml').yamlfmt,
        },
      },
    }
  end,
}
