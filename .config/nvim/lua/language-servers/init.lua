-- https://github.com/neovim/nvim-lspconfig
local lsp_status_ok, _ = pcall(require, 'lspconfig')
if not lsp_status_ok then
  return
end

require('language-servers.lsp-installer')
require('language-servers.handlers').setup()
--require "user.lsp.null-ls"

