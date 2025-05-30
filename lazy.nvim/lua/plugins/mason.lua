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
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "clang-format", "cpptools", "intelephense" }
			})
			
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
					})
				end,
				["clangd"] = function()
					local lspconfig = require("lspconfig")
					local capabilities = require("cmp_nvim_lsp").default_capabilities()

					lspconfig.clangd.setup({
						cmd = { "clangd", }, -- Caminho para o executável clangd
						--document_formatting = false,
						filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" }, -- Tipos de arquivos suportados
						root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"), -- Diretório raiz do projeto
						single_file_support = true, -- Suporte para arquivos isolados
						capabilities = capabilities, -- Suporte para autocomplete avançado
						init_options = {
							inlayHints = true, -- Ativa hints no init (para clangd >= 15)
						},
						on_attach = function(client, bufnr)
							-- Ativa popups automáticas quando o cursor para em uma função
							vim.api.nvim_create_autocmd("CursorHold", {
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.hover()
								end,
							})
							-- Inlay hints (Neovim 0.10+)
							if client.server_capabilities.inlayHintProvider then
								vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
							end
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
									"xdebug", "zip", "zlib", "wordpress", "woocommerce", "redis",
									"intl"
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
