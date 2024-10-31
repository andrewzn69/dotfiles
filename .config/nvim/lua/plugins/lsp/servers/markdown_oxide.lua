local util = require 'lspconfig.util'
return function(on_attach)
	return {
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
		end,
		cmd = { "markdown_oxide" },
		filetypes = { "markdown", "mdx" },
		root_dir = util.root_pattern(".git", vim.fn.getcwd()),
	}
end
