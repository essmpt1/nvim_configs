return {
	'lewis6991/gitsigns.nvim',
	config = function()
		require('gitsigns').setup {
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol', -- Mostra o texto no final da linha
				delay = 100,           -- Tempo para exibir o blame (ms)
				ignore_whitespace = false,
			},
		}
	end
}
