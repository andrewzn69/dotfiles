return {
	-- copilot
	{
		"zbirenbaum/copilot.lua",
		lazy = false,
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
			},
			panel = {
				enabled = true,
				auto_trigger = true
			},
			filetypes = {
				markdown = true,
				help = true,
				lua = true,
				bash = true,
				cs = true,
				python = true,
			},
		},
	},
	-- copilot cmp source
	{
		"nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				verylazy = true,
				dependencies = "copilot.lua",
				opts = {},
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
	},
}
