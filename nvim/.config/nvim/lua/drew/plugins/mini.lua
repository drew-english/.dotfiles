return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.pairs").setup()

		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = false })

		local original_section_git = statusline.section_git
		statusline.section_git = function(args)
			local default = original_section_git(args)
			if default == "" then
				return ""
			end

			local replaced, _ = default:gsub("Git ", "")
			return replaced
		end

		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
