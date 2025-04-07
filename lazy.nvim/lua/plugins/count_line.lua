return {
	dir = vim.fn.stdpath("config") .. "/lua/ft_count_line",
	name = "ft_count_line",
	lazy = false,
	config = function()
	  local f = require("ft_count_line")

	  vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "BufWinEnter" }, {
		pattern = {"*.c", "*.cpp"},
		callback = function()
		  f.show_virtual_text()
		end,
	  })
	end,
  }
