return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
	},
	config = function()
		local cmp = require'cmp'

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- Usa LuaSnip para snippets
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),  -- Inicia o autocomplete
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirma sugestão
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' }, -- Fonte do LSP
				{ name = 'luasnip' },  -- Fonte de snippets
			}, {
				{ name = 'buffer' },   -- Sugestões do buffer
				{ name = 'path' },     -- Sugestões de caminho
			})
		})

		vim.o.completeopt = "menu,menuone,noselect"
	end
}
