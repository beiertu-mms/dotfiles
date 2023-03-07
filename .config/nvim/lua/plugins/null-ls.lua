return {
  'jose-elias-alvarez/null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'mason.nvim' },
  opts = function()
    local nls = require('null-ls')
    return {
      sources = {
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.terraform_fmt,
      },
    }
  end,
}
--[[
return {
	{
		"jose-elias-alvarez/null-ls.nvim", -- https://github.com/jose-elias-alvarez/null-ls.nvim
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local filter_formatter = function(client)
			return client.name == "null-ls"
		end

		null_ls.setup({
			sources = {
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.terraform_fmt,
			},

			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = filter_formatter,
							})
						end,
					})
				end
			end,
		})
	end,
}
--]]
