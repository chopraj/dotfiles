return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
	keys = {
		{
			"<leader>gd",
			function()
				local view = require("diffview.lib").get_current_view()
				if view then
					vim.cmd("DiffviewClose")
				else
					vim.cmd("DiffviewOpen")
				end
			end,
			desc = "Toggle Git Diff View",
		},
		{
			"<leader>gl",
			function()
				local view = require("diffview.lib").get_current_view()
				if view then
					view.panel:focus()
				else
					vim.notify("Diffview is not open", vim.log.levels.INFO)
				end
			end,
			desc = "Diffview: focus file List",
		},
		{
			"<leader>go",
			function()
				local view = require("diffview.lib").get_current_view()
				if view and view.cur_layout and view.cur_layout.a then
					view.cur_layout.a:focus()
				else
					vim.notify("Diffview is not open", vim.log.levels.INFO)
				end
			end,
			desc = "Diffview: focus Old (HEAD) pane",
		},
		{
			"<leader>gn",
			function()
				local view = require("diffview.lib").get_current_view()
				if view and view.cur_layout and view.cur_layout.b then
					view.cur_layout.b:focus()
				else
					vim.notify("Diffview is not open", vim.log.levels.INFO)
				end
			end,
			desc = "Diffview: focus New (working) pane",
		},
	},
	opts = {
		enhanced_diff_hl = true,
		view = {
			default = {
				layout = "diff2_horizontal",
			},
		},
	},
}
