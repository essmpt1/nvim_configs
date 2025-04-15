return {
	dir = vim.fn.stdpath("config") .. "/lua/ft_count_line",
	name = "ft_count_line",
	lazy = false,
	config = function()
		local f = require("ft_count_line")

		local debounce_timer = nil

		local function debounce_update()
		if debounce_timer and not debounce_timer:is_closing() then
			debounce_timer:stop()
			debounce_timer:close()
		end

		debounce_timer = vim.defer_fn(function()
			f.show_virtual_text()
		end, 350) -- espera 350ms para evitar chamadas excessivas
	end

	vim.api.nvim_create_autocmd(
		{ "BufWritePost", "BufEnter", "BufWinEnter", "TextChanged", "TextChangedI" },
		{
			pattern = { "*.c", "*.cpp" },
			callback = debounce_update,
		}
	)
	end,
}
