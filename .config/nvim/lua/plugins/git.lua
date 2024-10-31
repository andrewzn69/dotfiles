return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signs = {
					add = { text = "▐" },
					change = { text = "▐" },
					delete = { text = "▐" },
					topdelete = { text = "▐" },
					changedelete = { text = "▐" },
					untracked = { text = "▐" },
				},
				signcolumn = true, -- toggle with `:Gitsigns toggle_signs`
				linehl = false, -- toggle with `:Gitsigns toggle_linehl`
				numhl = false, -- toggle with `:Gitsigns toggle_nunhl`
				word_diff = false, -- toggle with `:Gitsigns toggle_word_diff`
				sign_priority = 9,
				watch_gitdir = {
					interval = 1000,
				},
				attach_to_untracked = false,
			})
		end,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			local git_blame = require("gitblame")
			git_blame.setup({
				enable = true,
			})
		end,
	},
	{
		"rbong/vim-flog",
		event = "VeryLazy",
		dependencies = {
			"tpope/vim-fugitive",
		},
		cmd = {
			"Flog",
			"G",
			"Gbrowse",
			"GDelete",
			"GMove",
			"Gremove",
			"GRename",
			"GUnlink",
			"Gcd",
			"Gclog",
			"Gdiffsplit",
			"Gdrop",
			"Gedit",
			"Grep",
			"Ghdiffsplit",
			"Git",
			"Glcd",
			"Glgrep",
			"Gllog",
			"Gpedit",
			"Gread",
			"Gsplit",
			"Gtabedit",
			"Gvdiffsplit",
			"Gvsplit",
			"Gwq",
			"Gwrite",
		},
	},
}
