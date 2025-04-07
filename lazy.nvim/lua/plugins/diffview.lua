return {
	'sindrets/diffview.nvim',
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require('diffview').setup({
			diff_binaries = true,
			use_icons = true,
			enhanced_diff_hl = true,
			show_help_hints = true,
		})
	end
}
