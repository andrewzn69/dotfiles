return {
	"elentok/format-on-save.nvim",
	event = { "BufRead", "BufNewFile" },
	opts = function()
		local formatters = require("format-on-save.formatters")
		return {
			error_notifier = require("format-on-save.error-notifiers.vim-notify"),
			exclude_path_patterns = {
				"/node_modules/",
				".local/share/nvim/lazy",
			},
			formatter_by_ft = {
				astro = formatters.lsp,
				c = formatters.shell({ cmd = { "clang-format", "--style=file", "-i" } }), -- idk
				cmake = formatters.shell({ cmd = { "cmake-format", "-i" } }),           -- idk
				cpp = formatters.shell({ cmd = { "clang-format", "--style=file", "-i" } }), -- idk
				css = formatters.lsp,
				go = formatters.lsp,                                                    --idk
				html = formatters.lsp,
				java = formatters.shell({
					cmd = { "astyle", "-A2", "-s2", "-c", "-J", "-n", "-q", "-z2", "-xC80" },
				}), -- idk
				javascript = formatters.lsp,
				json = formatters.lsp,
				lua = formatters.lsp,
				nix = formatters.shell({ cmd = { "nixpkgs-fmt" } }),                       --idk
				php = formatters.shell({ cmd = { "php-cs-fixer", "fix", "--rules=@PSR12" } }), --idk
				python = formatters.lsp,
				rust = formatters.lsp,
				sh = formatters.shell({ cmd = { "shfmt", "-i", "0", "-sr", "-kp" } }),
				typescript = formatters.lsp,
				typescriptreact = formatters.lsp,
				yaml = formatters.lsp, -- does not work ?
				markdown = formatters.lsp, -- does not work ?
			},
			fallback_formatter = {
				formatters.remove_trailing_whitespace,
				formatters.remove_trailing_newlines,
				formatters.none_ls,
			},
		}
	end,
}
