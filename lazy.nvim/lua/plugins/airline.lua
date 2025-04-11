return {
	"vim-airline/vim-airline",
	dependencies = {
		"vim-airline/vim-airline-themes"
	},
	init = function()
		-- Ativar a tabline do airline
		vim.g["airline#extensions#tabline#enabled"] = 1
		vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
		vim.g["airline_powerline_fonts"] = 1
		vim.g["airline#extensions#tabline#buffer_nr_show"] = 1
		vim.g.airline_theme = "deus"

		vim.g["airline_section_z"] = "%3l:%-2c"
		vim.g["airline#extensions#visual#enabled"] = 1

	end
}
