return {
	"terrortylor/nvim-comment",
	event = "BufReadPost",
	config = function()
		require('nvim_comment').setup({
			{ "g",   group = "go" },
			{ "gc",  group = "comment" },
			{ "gcc", desc = "line" },
		})
	end,
}
