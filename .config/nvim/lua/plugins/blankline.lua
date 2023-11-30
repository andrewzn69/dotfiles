return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	config = function()
		require("ibl").setup({
			scope = {
				show_start = false,
				exclude = {
					language = {
						"yaml",
						"toml",
					},
				},
			},
			indent = {
				char = "",
				tab_char = "│",
				smart_indent_cap = true,
			},
			whitespace = {
				remove_blankline_trail = true,
			}
		})
	end,
}
