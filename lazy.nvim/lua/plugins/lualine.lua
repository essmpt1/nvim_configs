local function visual_selection_range()
	local mode = vim.fn.mode()
	if mode ~= 'v' and mode ~= 'V' and mode ~= '\22' then
		return ''
	end

	local start_pos = vim.fn.getpos("v")
	local end_pos = vim.fn.getpos(".")
	local start_line = start_pos[2]
	local start_col = start_pos[3]
	local end_line = end_pos[2]
	local end_col = end_pos[3]

	-- Corrigir ordem se seleção foi "de baixo para cima"
	if start_line > end_line or (start_line == end_line and start_col > end_col) then
		start_line, end_line = end_line, start_line
		start_col, end_col = end_col, start_col
	end

	local total_chars = 0

	for lnum = start_line, end_line do
		local line = vim.fn.getline(lnum)
		local len = #line

		if lnum == start_line and lnum == end_line then
		-- Seleção dentro da mesma linha
			total_chars = end_col - start_col + 1
		elseif lnum == start_line then
			total_chars = total_chars + (len - start_col + 2)
		elseif lnum == end_line then
			total_chars = total_chars + end_col
		else
			total_chars = total_chars + len + 1
		end
	end

	return string.format("󰉺 %d chars", total_chars)
end

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
			lualine_x = { visual_selection_range, "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location", {
				function()
					return " " .. os.date("%R")
				  end,
			} },
		},
		extension = { "lazy", "nvim-tree" },
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
