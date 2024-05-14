return {
	"echasnovski/mini.nvim",
	config = function()
		-- require("mini.ai").setup({ n_lines = 500 })
		require("mini.comment").setup()
		require("mini.bracketed").setup({
			undo = { suffix = "" },
			window = { suffix = "" },
			yank = { suffix = "" },
		})

		local statusline = require("mini.statusline")
		statusline.setup()

		-- local original_section_git = statusline.section_git
		-- statusline.section_git = function(args)
		-- 	local default = original_section_git(args)
		-- 	if default == "" then
		-- 		return ""
		-- 	end

		-- 	local replaced, _ = default:gsub("Git ", "")
		-- 	return replaced
		-- end

		-- local original_section_diagnostics = statusline.section_diagnostics
		-- statusline.section_diagnostics = function(args)
		-- 	local default = original_section_diagnostics(args)
		-- 	if default == "" then
		-- 		return ""
		-- 	end

		-- 	local replaced, _ = default:gsub("LSP ", "")
		-- 	return replaced
		-- end

		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
