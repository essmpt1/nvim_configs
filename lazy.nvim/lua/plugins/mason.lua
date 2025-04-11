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
					})
				end,
				["clangd"] = function()
					require("lspconfig").clangd.setup({
						cmd = { "clangd" }, -- Caminho para o executável clangd
						--document_formatting = false,
						filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" }, -- Tipos de arquivos suportados
						root_dir = require("lspconfig").util.root_pattern("compile_commands.json", ".git"), -- Diretório raiz do projeto
						single_file_support = true, -- Suporte para arquivos isolados
						capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Suporte para autocomplete avançado
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
				end,
				['intelephense'] = function()
					local lspconfig = require("lspconfig")
					local capabilities = require("cmp_nvim_lsp").default_capabilities()

					lspconfig.intelephense.setup({
						cmd = { "intelephense", "--stdio" },
						filetypes = { "php" },
						capabilities = capabilities,
						root_dir = lspconfig.util.root_pattern("composer.json", ".git", "."),
						settings = {
							intelephense = {
								stubs = {
									"bcmath", "bz2", "Core", "curl", "date", "dom",
									"fileinfo", "filter", "gd", "hash", "iconv", "json",
									"libxml", "mbstring", "openssl", "pcre", "PDO",
									"pdo_mysql", "Phar", "readline", "Reflection", "session",
									"SimpleXML", "sodium", "SPL", "standard", "tokenizer", "xml",
									"xdebug", "zip", "zlib", "wordpress", "woocommerce"
								},
								files = {
									maxSize = 1000000,
								},
							},
						},
					})
				end
			})
		end
	}
}
