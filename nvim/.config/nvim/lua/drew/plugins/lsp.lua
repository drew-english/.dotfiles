vim.pack.add({
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/folke/lazydev.nvim"
})

require("lazydev").setup()
require("mason").setup()

-- Set local settings on LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("drew-lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        map("gD", function()
            vim.cmd("split | normal T")
            vim.lsp.buf.definition()
        end, "[G]oto [D]efinition in new tab")
        map("<leader>f", vim.lsp.buf.format, "[F]ormat buffer")

        local client = assert(vim.lsp.get_client_by_id(event.data.client_id), "must have valid client")
        client.server_capabilities.semanticTokensProvider = nil

        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        end

        if client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

vim.lsp.enable({ 'ruby_lsp', 'lua_ls', 'gopls', 'copilot' })

vim.lsp.inline_completion.enable()
vim.keymap.set('i', '<Tab>', function()
    if not vim.lsp.inline_completion.get() then
        return '<Tab>'
    end
end, { expr = true, desc = 'Accept the current inline completion' })

-- Update UI progress with LSP progress notifications
vim.api.nvim_create_autocmd('LspProgress', {
    callback = function(ev)
        local value = ev.data.params.value
        vim.api.nvim_echo({ { value.message or 'done' } }, false, {
            id = 'lsp.' .. ev.data.params.token,
            kind = 'progress',
            source = 'vim.lsp',
            title = value.title,
            status = value.kind ~= 'end' and 'running' or 'success',
            percent = value.percentage,
        })
        vim.cmd("redrawstatus")
    end,
})

-- Set busy status when LSP is processing
vim.api.nvim_create_autocmd('LspRequest', {
    callback = function(ev)
        local request = ev.data.request
        if request.type == 'pending' then
            vim.bo.busy = (vim.bo.busy or 0) + 1
        elseif request.type == 'cancel' then
            vim.bo.busy = math.max(0, vim.bo.busy - 1)
        elseif request.type == 'complete' then
            vim.bo.busy = math.max(0, vim.bo.busy - 1)
        end
    end,
})
