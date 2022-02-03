-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/nvim-lsp-installer

require('functions')
local nvim_lsp = require('lspconfig')
local lsp_installer_servers = require('nvim-lsp-installer.servers')
require("nvim-lsp-installer").settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
nmap("<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
nmap("<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

local buf_map = function(bufnr, mode, keys, command)
  vim.api.nvim_buf_set_keymap(bufnr, mode, keys, command, { noremap=true, silent=true })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_map(bufnr, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_map(bufnr, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  buf_map(bufnr, 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  buf_map(bufnr, 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  buf_map(bufnr, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  buf_map(bufnr, '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  buf_map(bufnr, '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  buf_map(bufnr, '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  buf_map(bufnr, '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  buf_map(bufnr, '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  buf_map(bufnr, '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  buf_map(bufnr, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  buf_map(bufnr, '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
end

local servers = {
    "kotlin_language_server",
    "bashls",
}

for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer_servers.get_server(server_name)
  if server_available then
    server:on_ready(function ()
      -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
      -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
      -- function to set up servers, to avoid doing setting up a server twice.
      local opts = {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
          debounce_text_changes = 150,
        }
      }
      server:setup(opts)
    end)
    if not server:is_installed() then
      -- Queue the server to be installed.
      server:install()
    end
  end
end

