return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("lualine").setup({
		options = {
			theme = "auto",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			icons_enabled = true,
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { { "mode", icon = "" } },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1 } }, -- mostra caminho relativo
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" }, -- igual ao %l:%c que usava no airline
		},
		tabline = {
			lualine_a = {
				{
					"buffers",
					mode = 2, -- mostra apenas o nome do arquivo (como "unique_tail")
					symbols = {
						modified = " ●", -- ícone de modificação
						alternate_file = "#", -- alternativo
						directory = "", -- diretório
					},
					filetype_names = {
						TelescopePrompt = "Telescope",
						dashboard = "Dashboard",
						packer = "Packer",
						NvimTree = "File Explorer",
					},
						buffers_color = {
						active = "lualine_a_normal",   -- cor do buffer atual
						inactive = "lualine_a_inactive", -- cor dos demais
					},
						show_filename_only = true,
						show_modified_status = true,
						max_length = vim.o.columns * 2 / 3,
						use_mode_colors = false,
				},
			},
		},
	})
	end
}
