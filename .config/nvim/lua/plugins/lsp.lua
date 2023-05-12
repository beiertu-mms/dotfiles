return {
  'VonHeikemen/lsp-zero.nvim', -- https://github.com/VonHeikemen/lsp-zero.nvim
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { 'williamboman/mason.nvim', build = ':MasonUpdate' }, -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' }, -- Required
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'saadparwaiz1/cmp_luasnip' },
    -- Schema Store
    { 'b0o/schemastore.nvim' },
    -- Pictograms for LSP
    { 'onsails/lspkind.nvim' },
  },
  config = function()
    -- Language Servers configuration
    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
    end)

    -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    lsp.ensure_installed({
      'bashls',
      'diagnosticls',
      'dockerls',
      'gopls',
      'html',
      'jsonls',
      'lua_ls',
      'pyright',
      'terraformls',
      'lemminx',
      'yamlls',
    })

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    require('lspconfig').yamlls.setup({
      settings = {
        yaml = {
          keyOrdering = false,
        },
      },
    })

    require('lspconfig').jsonls.setup({
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    })

    lsp.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['null-ls'] = { 'go', 'lua', 'sh', 'terraform' },
      },
    })

    lsp.set_sign_icons({
      error = '✘',
      warn = '',
      hint = '⚑',
      info = '',
    })

    lsp.setup()

    -- Autocompletion configuration
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
      },
      completion = {
        autocomplete = false,
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
        }),
      },
    })
  end,
}
