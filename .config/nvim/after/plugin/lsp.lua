--[[
-- https://github.com/VonHeikemen/lsp-zero.nvim
--]]
local status_ok, lsp = pcall(require, 'lsp-zero')
if not status_ok then
  print('lsp is not installed')
  return
end

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '',
  },
})

lsp.ensure_installed({
  'bashls',
  'diagnosticls',
  'dockerls',
  'gopls',
  'html',
  'jsonls',
  -- 'kotlin_language_server',
  'marksman',
  'pyright',
  -- "spectral",
  'sqls',
  'lua_ls',
  'terraformls',
  'vimls',
  'yamlls',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = '',
    warn = '',
    hint = '',
    info = '',
  },
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.name == 'eslint' then
    vim.cmd.LspStop('eslint')
    return
  end

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})

-- Setup Json SchemaStore via https://github.com/b0o/SchemaStore.nvim
require('lspconfig').jsonls.setup({
  settings = {
    json = {
      validate = { enable = true },
      schemas = require('schemastore').json.schemas({
        -- https://github.com/SchemaStore/schemastore/blob/master/src/api/json/catalog.json
        select = {
          'Common types for all schemas',
          -- "dependabot-v2.json",
          'detekt.yml',
          'dockerd.json',
          'docker-compose.yml',
          'Helm Chart.yaml',
          'Helm Chart.lock',
          'helmfile',
          'GitHub Action',
          'GitHub Workflow',
          'GitHub Workflow Template Properties',
          'Hadolint',
          'JSON-API',
          'kustomization.yaml',
          'Liquibase',
          'openapi.json',
          'semantic-release',
          'Starship',
          'Swagger API 2.0',
        },
        replace = {
          ['dependabot-v2.json'] = {
            name = 'dependabot-v2.json',
            description = "Override dependabot-v2.json, because it's only supported yml file ending",
            fileMatch = { '**/.github/dependabot.yml', '**/.github/dependabot.yaml' },
            url = 'https://json.schemastore.org/dependabot-2.0.json',
          },
        },
      }),
    },
  },
})
