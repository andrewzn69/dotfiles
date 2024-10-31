return {
	'goolord/alpha-nvim',
	event = 'VimEnter',
	opts = function()
		local dashboard = require('alpha.themes.dashboard')

		-- ascii art for header section
		dashboard.section.header.val = {
			[[       ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄]],
			[[       ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄]],
			[[      ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ]],
			[[      ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ]],
			[[    ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ]],
			[[    ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ]],
			[[   ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ]],
			[[   ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟ ]],
			[[   ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃ ]],
			[[   ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣵⣾⠃ ]],
			[[    ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⠃ ]],
			[[     ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁ ]],
			[[       ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁ ]],
			[[          ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ]],
			[[   ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ]],
		}
		-- set header highlight to white
		dashboard.section.header.opts.hl = 'Normal'

		-- buttons section
		dashboard.section.buttons.val = {
			dashboard.button('i', '    new file', ':ene <BAR> startinsert<CR>'),
			dashboard.button('o', '    old files', ':Telescope oldfiles<CR>'),
			dashboard.button('f', '󰥨    find file', ':Telescope file_browser<CR>'),
			dashboard.button('g', '󰱼    find text', ':Telescope live_grep_args<CR>'),
			dashboard.button('h', '    browse git', ':Flog<CR>'),
			dashboard.button('l', '󰒲    lazy', ':Lazy<CR>'),
			dashboard.button('m', '󱌣    mason', ':Mason<CR>'),
			dashboard.button('p', '󰄉    profile', ':Lazy profile<CR>'),
			dashboard.button('q', '󰭿    quit', ':qa<CR>'),
		}

		-- button highlights
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = 'Normal'
			button.opts.hl_shortcut = 'Function'
		end

		-- footer with default text
		dashboard.section.footer.val = "Welcome to Neovim"
		dashboard.section.footer.opts.hl = "Special"

		dashboard.opts.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 4 },
			dashboard.section.buttons,
			{ type = "padding", val = 2 },
			dashboard.section.footer,
		}
		return dashboard
	end,

	config = function(_, dashboard)
		-- init alpha with the specified dashboard
		require('alpha').setup(dashboard.opts)

		-- footer update on LazyVim startup
		vim.api.nvim_create_autocmd('User', {
			pattern = 'LazyVimStarted',
			callback = function()
				local stats = require('lazy').stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				dashboard.section.footer.val = '󱐋 ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms'
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
