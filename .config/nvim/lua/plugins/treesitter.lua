return {
  'nvim-treesitter/nvim-treesitter', -- https://github.com/nvim-treesitter/nvim-treesitter
  build = ':TSUpdate',
  config = function()
    local treesitter = require('nvim-treesitter.configs')

    treesitter.setup({
      -- A list of parser names, or "all"
      ensure_installed = {
        'c',
        'bash',
        'comment',
        'css',
        'dockerfile',
        'go',
        'gomod',
        'gowork',
        'hcl',
        'hjson',
        'hocon',
        'html',
        'java',
        'javascript',
        'json',
        'json5',
        'kotlin',
        'lua',
        'make',
        'markdown',
        'python',
        'rasi',
        'regex',
        'scss',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
