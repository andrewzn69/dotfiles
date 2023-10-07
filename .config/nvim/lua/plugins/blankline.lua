return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "VeryLazy" },
	config = function()
		require("ibl").setup({
			indent = { 
				tab_char = "▎",
				char = " ",
			},
			scope = {
				enabled = true,
			},
		})
	end,
}
