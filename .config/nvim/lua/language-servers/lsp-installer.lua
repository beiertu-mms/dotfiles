-- https://github.com/williamboman/nvim-lsp-installer
local installer_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_status_ok then
	return
end

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

local lsp_servers_status_ok, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not lsp_servers_status_ok then
	return
end

local servers = {
	"bashls", -- Bash
	"clangd", -- C
	"cmake", -- CMake
	"diagnosticls", -- Diagnostic (general purpose server)
	"dockerls", -- Docker
	"gopls", -- Go
	"graphql", -- GraphQL
	"groovyls", -- Groovy
	"html", -- HTML
	"jsonls", -- JSON
	"jdtls", -- Java
	"tsserver", -- JavaScript
	"kotlin_language_server", -- Kotlin
	"texlab", -- LaTeX
	"sumneko_lua", -- Lua
	-- "spectral", -- OpenAPI
	"pyright", -- Python
	"rust_analyzer", -- Rust [(wiki)][rust_analyzer]
	-- "sqlls", -- SQL
	"taplo", -- TOML
	"terraformls", -- Terraform
	"vimls", -- VimL
	"lemminx", -- XML
	"yamlls", -- YAML
	"zk", -- Markdown
}

-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
	local server_available, server = lsp_installer_servers.get_server(server_name)
	if server_available then
		server:on_ready(function()
			local opts = {
				on_attach = require("language-servers.handlers").on_attach,
				capabilities = require("language-servers.handlers").capabilities,
			}

			if server.name == "sumneko_lua" then
				local sumneko_opts = require("language-servers.settings.sumneko_lua")
				opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
			end

			if server.name == "jsonls" then
				local jsonls_opts = require("language-servers.settings.jsonls")
				opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
			end

			server:setup(opts)
		end)
		if not server:is_installed() then
			server:install()
		end
	end
end
