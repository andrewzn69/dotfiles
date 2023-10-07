return {
	"SmiteshP/nvim-navic",
	event = "LspAttach",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		local navic = require("nvim-navic")
		local icons = require("utils.icons")
		local lualine = require("lualine")

		navic.setup {
			icons = {
				File = icons.navic.File,
				Module = icons.navic.Module,
				Namespace = icons.navic.Namespace,
				Package = icons.navic.Package,
				Class = icons.navic.Class,
				Method = icons.navic.Method,
				Property = icons.navic.Property,
				Field = icons.navic.Field,
				Constructor = icons.navic.Constructor,
				Enum = icons.navic.Enum,
				Interface = icons.navic.Interface,
				Function = icons.navic.Function,
				Variable = icons.navic.Variable,
				Constant = icons.navic.Constant,
				String = icons.navic.String,
				Number = icons.navic.Number,
				Boolean = icons.navic.Boolean,
				Array = icons.navic.Array,
				Object = icons.navic.Object,
				Key = icons.navic.Key,
				Null = icons.navic.Null,
				EnumMember = icons.navic.EnumMember,
				Struct = icons.navic.Struct,
				Event = icons.navic.Event,
				Operator = icons.navic.Operator,
				TypeParameter = icons.navic.TypeParameter,
			},
			lsp = {
				auto_attach = true,
				preference = nil,
			},
			highlight = true,
			separator = " > ",
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = true,
			lazy_update_context = false,
			click = true
		}
	end,
}
