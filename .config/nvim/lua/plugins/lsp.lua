-- see also https://lsp-zero.netlify.app/blog/you-might-not-need-lsp-zero.html
return {
  {
    'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim
    build = ':MasonUpdate',
    opts = {
      ui = {
        border = 'single',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
    event = 'BufReadPre',
    dependencies = {
      -- Package manager to install and manage LSP servers, DAP servers, linters, and formatters.
      {
        'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim
        dependencies = { 'williamboman/mason.nvim' },
      },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
      -- Schema Store
      { 'b0o/schemastore.nvim' },
      -- Pictograms for LSP
      { 'onsails/lspkind.nvim' },
      { url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },
    },
    config = function()
      -- note: diagnostics are not exclusive to lsp servers
      -- so these can be global keybindings
      vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
      vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
      vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          -- these will be buffer-local keybindings
          -- because they only work if you have an active language server
          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
      })

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          'bashls',
          'dagger',
          'diagnosticls',
          'dockerls',
          'gopls',
          'helm_ls',
          'html',
          'jsonls',
          'lua_ls',
          'marksman',
          'pyright',
          'terraformls',
          'lemminx',
          'yamlls',
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = lsp_capabilities,
            })
          end,

          lua_ls = function()
            lspconfig.lua_ls.setup({
              capabilities = lsp_capabilities,
              on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                  return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                  telemetry = { enable = false },
                  runtime = { version = 'LuaJIT' },
                  -- diagnostics = { globals = { 'vim' } },
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      vim.env.VIMRUNTIME,
                      '${3rd}/luv/library',
                      -- "${3rd}/busted/library",
                    },
                  },
                })
              end,
              settings = {
                Lua = {},
              },
            })
          end,

          yamlls = function()
            lspconfig.yamlls.setup({
              capabilities = lsp_capabilities,
              settings = {
                yaml = {
                  keyOrdering = false,
                },
              },
            })
          end,

          jsonls = function()
            lspconfig.jsonls.setup({
              capabilities = lsp_capabilities,
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                },
              },
            })
          end,

          gopls = function()
            lspconfig.gopls.setup({
              capabilities = lsp_capabilities,
              settings = {
                gopls = {
                  completeUnimported = true,
                  usePlaceholders = true,
                  analyses = {
                    unusedparams = true,
                    unreachable = true,
                  },
                },
              },
            })
          end,
        },
      })

      require('lsp_lines').setup()

      vim.diagnostic.config({
        -- Disable virtual_text since it's redundant due to lsp_lines.
        virtual_text = false,
        virtual_lines = { only_current_line = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '󰉀',
            [vim.diagnostic.severity.INFO] = '',
          },
        },
      })

      local cmp = require('cmp')

      cmp.setup({
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'buffer', keyword_length = 3 },
          { name = 'luasnip', keyword_length = 2 },
        },
        preselect = 'item',
        completion = {
          autocomplete = false,
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert({
          -- Enter key confirms completion item
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          -- Ctrl + space triggers completion menu
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })

      -- https://github.com/windwp/nvim-autopairs#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
