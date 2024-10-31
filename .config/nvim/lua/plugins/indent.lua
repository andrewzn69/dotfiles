return {
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "VeryLazy",
		opts = {
			symbol = "│",
			options = {
				try_as_border = true,
			},
			draw = {
				animation = function()
					return 0
				end,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
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
					"man",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("ibl").setup({
				scope = {
					show_start = false,
					enabled = false,
					exclude = {
						language = {
							"yaml",
							"toml",
						},
					},
				},
				indent = {
					char = "│",
					tab_char = "│",
					smart_indent_cap = true,
				},
				whitespace = {
					remove_blankline_trail = true,
				},
			})
		end,
	},
}
