return {
  'stevearc/conform.nvim', -- https://github.com/stevearc/conform.nvim
  event = 'VeryLazy',
  opts = {
    formatters_by_ft = {
      cue = { 'cue_fmt' },
      go = { 'gofmt' },
      json = { 'jq' },
      kotlin = { 'ktlint' },
      lua = { 'stylua' },
      python = { 'black' },
      sh = { 'shfmt' },
      terraform = { 'terraform_fmt' },
      yaml = { 'yamlfmt' },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  },
}
