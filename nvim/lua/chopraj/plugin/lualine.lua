return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

        local mode = {
            'mode',
            fmt = function(str)
                -- return ' ' 
                -- displays only the first character of the mode
                return ' ' .. str
            end,
        }

        local filename = {
            'filename',
            file_status = true,
            path = 1, -- relative path; trimmed below to the last few segments
            fmt = function(str)
                -- Keep only the filename + its two parent dirs (e.g. .../components/ui/Button.tsx)
                local parts = vim.split(str, "/", { plain = true })
                if #parts <= 3 then
                    return str
                end
                return ".../" .. table.concat({ parts[#parts - 2], parts[#parts - 1], parts[#parts] }, "/")
            end,
        }

        local branch = {'branch', icon = {'', color={fg='#A6D4DE'}}, '|'}


		lualine.setup({
            icons_enabled = true,
			options = {
				theme = "auto",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
			},
			sections = {
                lualine_a = { mode },
                lualine_b = { branch },
                lualine_c = { filename },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { filename },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
