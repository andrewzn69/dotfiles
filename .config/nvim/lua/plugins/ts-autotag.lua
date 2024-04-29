return {
	"windwp/nvim-ts-autotag",
	config = function()
		local autotag = require("nvim-ts-autotag")
		autotag.setup({
			autotag = {
				enable = true,
				filetypes = {
					'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
					'rescript',
					'xml',
					'php',
					'markdown',
					'glimmer', 'handlebars', 'hbs',
					'astro'
				}
			}
		})
	end,
}
