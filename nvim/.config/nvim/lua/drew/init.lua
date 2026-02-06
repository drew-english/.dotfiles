require("drew.remap")
require("drew.set")
require("drew.lazy")

vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
	local current_value = vim.diagnostic.config().virtual_text
	if current_value then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
end, {})

vim.api.nvim_create_user_command("MarkdownToJira", function()
    -- current buffer content
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local content = table.concat(lines, "\n")

    local result = vim.fn.system("pandoc -f markdown -t jira", content)
    if vim.v.shell_error ~= 0 then
        print("Error converting markdown to jira format: " .. result)
        return
    end

    vim.fn.setreg("+", result)
    print("Content copied to clipboard")
end, {})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("drew-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
