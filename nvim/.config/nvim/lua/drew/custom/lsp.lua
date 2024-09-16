require("lazydev").setup()
require("mason").setup()
require("lsp-feedback").setup({
	statusline = {
		base_hl_group = "MiniStatuslineDevinfo",
		slow_request_hl_group = "MiniStatuslineModeInsert",
		bad_response_hl_group = "MiniStatuslineModeReplace",
	},
})

-- Set local settings on LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("drew-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
		map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("<leader>csd", require("telescope.builtin").lsp_document_symbols, "[C]ode [S]ymbols [D]ocument")
		map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

		local client = assert(vim.lsp.get_client_by_id(event.data.client_id), "must have valid client")
		client.server_capabilities.semanticTokensProvider = nil

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

-- LSP server configuration
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local server_cfgs = {
	zls = {
		settings = {
			enable_build_on_save = true,
		},
	},
}

local ensure_installed = {
	"gopls",
	"lua_ls",
	"ruby_lsp",
}

require("mason-lspconfig").setup({
	ensure_installed = ensure_installed,
	handlers = {
		function(server_name)
			local server = server_cfgs[server_name] or {}

			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})
