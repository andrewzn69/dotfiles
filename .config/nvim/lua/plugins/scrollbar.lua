return {
	"petertriho/nvim-scrollbar",
	event = "VeryLazy",
	config = function()
		local scrollbar = require("scrollbar")
		scrollbar.setup({
			show_in_active_only = true,
			handle = {
				blend = 0,
				text = " ",
			},
			marks = {
				Cursor = { text = " " },
			}
		})
	end,
}
