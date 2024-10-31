return {
	'yamatsum/nvim-cursorline',
	config = function()
		local nvim_cursorline = require('nvim-cursorline')
		nvim_cursorline.setup({
			cursorline = {
				enable = false,
			},
			cursorword = {
				enable = true,
				min_length = 3,
				hl = { underline = true }
			},
		})
	end,
}
