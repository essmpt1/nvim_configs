local lspconfig = require'lspconfig'

lspconfig.clangd.setup {
	cmd = { "clangd" }, -- Caminho para o executável clangd
	filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" }, -- Tipos de arquivos suportados
	root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"), -- Diretório raiz do projeto
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
	end,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded", -- Opções: "single", "double", "rounded", "shadow"
})

vim.o.updatetime = 500 -- Tempo de espera reduzido para 500ms

require'lspconfig'.intelephense.setup{
	cmd = { "intelephense", "--stdio" },  -- Ensure --stdio is used
	filetypes = { "php" },
	root_dir = require'lspconfig'.util.root_pattern("composer.json", ".git"),
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.intelephense.setup {
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
				maxSize = 1000000;
			}
		}
	}
}
