return {
	{
		'williamboman/mason.nvim',
		config = function()
			require("mason").setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = function(client, bufnr)
							-- Ativa popups automáticas quando o cursor para em uma função
							vim.api.nvim_create_autocmd("CursorHold", {
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.hover()
								end,
							})
						end
					})
				end
			})
		end
	}
}
