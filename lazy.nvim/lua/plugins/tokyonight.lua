return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "storm", -- "storm", "moon", "night", "day"
		transparent = false,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
		},
	},
	init = function()
		vim.opt.termguicolors = true
		vim.opt.background = "dark" -- "light"
	end
}
