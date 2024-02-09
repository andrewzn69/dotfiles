return {
	"aurum77/live-server.nvim",
	event = "VeryLazy",
	config = function()
		local live_server = require("live_server")
		live_server.setup({
			port = 6969,
			browser_command = "firefox", -- Command or executable path
			quiet = false,
			no_css_inject = false,
		})
	end,
}
