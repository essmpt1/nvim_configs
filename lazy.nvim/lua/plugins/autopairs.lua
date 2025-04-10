return {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	--config = true
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup {}

		-- integração com nvim-cmp
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
}
