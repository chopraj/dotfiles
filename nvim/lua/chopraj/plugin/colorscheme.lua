return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"chaosteil/pierre-theme.nvim",
		lazy = true,
	},
	{
		"webhooked/kanso.nvim",
		lazy = true,
		config = function()
			require("kanso").setup({
				background = {
					dark = "zen",
					light = "pearl",
				},
			})
		end,
	},
}
