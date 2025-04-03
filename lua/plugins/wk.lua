local wk = require("which-key")
wk.setup {
	opts = {
	},
plugins = {
	presets = {
		operators = false, -- desativa atalhos para operadores (como `d`, `y`)
		motions = false,   -- desativa atalhos para motions (como `w`, `e`)
		text_objects = false, -- desativa atalhos para objetos de texto
		windows = false,   -- desativa atalhos para comandos de janela
		nav = false,       -- desativa atalhos de navegação (como `gj`, `gk`)
		z = false,         -- desativa atalhos do prefixo `z`
		g = false,         -- desativa atalhos do prefixo `g`
	},
	},
keys = {
	scroll_down = "<c-u>",
	scroll_up = "<c-d>",
	},
}
