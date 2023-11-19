return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		local icons = require("nvim-web-devicons")
		icons.setup({
			override = {},
			default = true
		})
	end,
}
