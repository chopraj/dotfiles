return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			indent = { enabled = false },
			input = { enabled = true },
			quickfile = { enabled = true },
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
					{
						section = "terminal",
						cmd = "ascii-image-converter ~/Desktop/login-hero.png -C -c",
						random = 15,
						pane = 2,
						indent = 15,
						height = 20,
					},
				},
			},
		},
		keys = {
			{
				"<leader>clr",
				function()
					require("snacks").picker.colorschemes({ layout = "ivy" })
				end,
				desc = "Pick Color Schemes",
			},

			-- Snacks Picker
			{
				"<leader>ff",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>fl",
				function()
					require("snacks").picker.lines({
						layout = "ivy",
						jump = { close = false },
					})
				end,
				desc = "Find Lines in Buffer",
			},
		},
	},
}
