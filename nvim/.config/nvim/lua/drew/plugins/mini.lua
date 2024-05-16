return {
	"echasnovski/mini.nvim",
	config = function()
		-- require("mini.ai").setup({ n_lines = 500 })
		require("mini.comment").setup()
		require("mini.bracketed").setup({
			undo = { suffix = "change" },
			window = { suffix = "" },
			yank = { suffix = "a change" },
		})

		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = {
					add = "+",
					change = "~",
					delete = "_",
				},
			},
		})

		local statusline = require("mini.statusline")
		statusline.setup()

		local format_summary = function(data)
			local summary = vim.b[data.buf].minidiff_summary
			local t = {}
			if summary.add > 0 then
				table.insert(t, "+" .. summary.add)
			end
			if summary.change > 0 then
				table.insert(t, "~" .. summary.change)
			end
			if summary.delete > 0 then
				table.insert(t, "-" .. summary.delete)
			end
			vim.b[data.buf].minidiff_summary_string = table.concat(t, " ")
		end
		local au_opts = { pattern = "MiniDiffUpdated", callback = format_summary }
		vim.api.nvim_create_autocmd("User", au_opts)

		statusline.section_git = function(args)
			if vim.bo.buftype ~= "" then
				return ""
			end

			local head = vim.fn.FugitiveHead() or ""
			local signs = MiniStatusline.is_truncated(args.trunc_width) and "" or (vim.b.minidiff_summary_string or "")
			local icon = args.icon or ""

			local str = ""
			if head ~= "" then
				str = str .. icon .. " " .. head
			end

			if signs ~= "" then
				if str ~= "" then
					str = str .. " "
				end

				str = str .. signs
			end

			return str
		end

		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
