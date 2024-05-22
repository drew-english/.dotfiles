local statusline = require("mini.statusline")
local diff = require("mini.diff")

vim.keymap.set("n", "<leader>hd", diff.toggle_overlay, { desc = "Toggle [h]unk [d]iff overlay" })
vim.keymap.set(
	"n",
	"-",
	"<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>",
	{ desc = "Open MiniFiles" }
)

-- Set change summary format to +{add} ~{change} -{delete}
local format_summary = function(data)
	local target = vim.b[data.buf]
	local summary = target.minidiff_summary

	if summary == nil then
		target.minidiff_summary_string = ""
		return
	end

	local t = {}
	if summary.add ~= nil and summary.add > 0 then
		table.insert(t, "+" .. summary.add)
	end
	if summary.change ~= nil and summary.change > 0 then
		table.insert(t, "~" .. summary.change)
	end
	if summary.delete ~= nil and summary.delete > 0 then
		table.insert(t, "-" .. summary.delete)
	end
	target.minidiff_summary_string = table.concat(t, " ")
end
local au_opts = { pattern = "MiniDiffUpdated", callback = format_summary }
vim.api.nvim_create_autocmd("User", au_opts)

-- Modify section_git to use mini.diff instead of gitsigns
statusline.section_git = function(args)
	if vim.bo.buftype ~= "" then
		return ""
	end

	local head = vim.fn.FugitiveHead() or ""
	local signs = statusline.is_truncated(args.trunc_width) and "" or (vim.b.minidiff_summary_string or "")
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

-- Simplify statusline location
statusline.section_location = function()
	return "%2l:%-2v"
end

-- Add custom keymaps to mini.files
local files_open_new_win = function(win_cmd)
	return function()
		local new_target_window
		vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
			vim.cmd(win_cmd)
			new_target_window = vim.api.nvim_get_current_win()
		end)

		MiniFiles.set_target_window(new_target_window)
		MiniFiles.go_in({ close_on_file = true })
	end
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		vim.keymap.set("n", "<c-v>", files_open_new_win("vs"), { buffer = buf_id, desc = "Open in vertical split" })
		vim.keymap.set("n", "<c-t>", files_open_new_win("tabnew"), { buffer = buf_id, desc = "Open in new tab" })
	end,
})
