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
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				}
			}
		})
	end,
}
