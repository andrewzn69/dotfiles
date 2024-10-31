local hostname = vim.loop.os_gethostname()

if hostname == 'arch' then
	return {
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local gruvbox = require("gruvbox")
			gruvbox.setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {
					dark0 = "#1D2022",
					dark1 = "#2C2C2C",
					bright_green = "#98971A",
					bright_yellow = "#D79921",
				},
				overrides = {
					MiniIndentscopeSymbol = { fg = "#A89984" }, -- for mini.indentscope
					SignColumn = { bg = "#1D2022" },       -- for sign column
				},
				dim_inactive = false,
				transparent_mode = false,
			})
			vim.cmd("colorscheme gruvbox")
		end,
	}
elseif hostname == 'archnb' then
	return {
		{
			"nyoom-engineering/oxocarbon.nvim",
			lazy = false,
			config = function()
				vim.cmd("colorscheme oxocarbon")
			end
		},
	}
end
