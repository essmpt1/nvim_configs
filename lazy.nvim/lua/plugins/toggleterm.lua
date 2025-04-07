return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<C-\>]], -- Use Ctrl+\ para abrir/fechar o terminal
		direction = "float",      -- Pode ser 'horizontal', 'vertical', ou 'float'
		float_opts = {
			border = "curved",      -- Estilo da borda: 'single', 'double', 'curved'
		},
		size = 20,                -- Tamanho do terminal (em modo horizontal/vertical)
		shade_terminals = true,   -- Habilitar sombreado no terminal
		shading_factor = 2,       -- Nível de sombra
	}
}
