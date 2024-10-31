-- lazy

local pluginspath = vim.fn.stdpath("data") .. "/lazy"
local lazypath = pluginspath .. "/lazy.nvim"

-- install lazy if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"--single-branch",
	"https://github.com/folke/lazy.nvim.git",
	lazypath,
})

vim.opt.runtimepath:prepend(lazypath)

-- use protected call so we don't error out on firt use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("lazy has been installed, restart nvim")
	return
end

-- install plugins
lazy.setup({
	spec = {
		require("plugins.alpha"),
		require("plugins.astro"),
		require("plugins.autopairs"),
		require("plugins.cmp"),
		require("plugins.colorizer"),
		require("plugins.comment"),
		require("plugins.copilot"),
		require("plugins.cursorline"),
		require("plugins.dadbod"),
		require("plugins.diffview"),
		require("plugins.format"),
		require("plugins.fzf"),
		require("plugins.git"),
		require("plugins.indent"),
		require("plugins.live-server"),
		require("plugins.lsp"),
		require("plugins.lualine"),
		require("plugins.luasnip"),
		require("plugins.markdown"),
		require("plugins.mason"),
		require("plugins.scrollbar"),
		require("plugins.surround"),
		require("plugins.telescope"),
		require("plugins.theme"),
		require("plugins.treesitter"),
		require("plugins.trouble"),
		require("plugins.ts-autotag"),
		require("plugins.typst"),
		require("plugins.which-key"),
		require("plugins.yuck"),
	},
	dev = {
		path = "~/.local/src",
	},
	lockfile = vim.fn.stdpath("config") .. "/lua/plugins/lazy-lock.json",
	ui = {},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			disabled_plugins = {
			},
		},
	},
})
