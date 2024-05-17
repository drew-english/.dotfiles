local cmp = require("cmp")
local ls = require("luasnip")
ls.config.setup({})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

cmp.setup({
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body)
		end,
	},
	completion = { completeopt = "menu,menuone,noselect" },
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	},
})
