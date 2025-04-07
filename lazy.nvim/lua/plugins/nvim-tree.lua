return {
	'nvim-tree/nvim-tree.lua',
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		view = {
			width = 30,
			side = "left",
		},
		renderer = {
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
					modified = true
				},
			},
		},
	}
}
