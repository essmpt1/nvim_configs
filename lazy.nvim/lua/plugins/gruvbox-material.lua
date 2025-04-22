return {
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Ativar cores verdadeiras
			--vim.opt.termguicolors = true

			-- Tema com fundo escuro
			-- vim.opt.background = "dark"

			vim.g.gruvbox_material_background = "medium"  -- ou "soft", "hard"
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_foreground = "material"  -- ou "mix", "original"

			-- Aplicar o esquema de cores
--			vim.cmd.colorscheme("gruvbox-material")
		end
	}
