return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			--    ensure_installed = "all", -- Instala todas linguagens suportadas
				ensure_installed = { "c", "cpp", "lua", "vim", "json", "markdown", "markdown_inline" },
				highlight = { enable = true },
				indent = { enable = true },
				additional_vim_regex_highlighting = false,
			})
	end,
}
