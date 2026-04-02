vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/RRethy/nvim-treesitter-endwise",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
})

-- _opts = {
--     ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
--     auto_install = true,
--     highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = { "ruby" },
--     },
--     indent = { enable = true, disable = { "ruby" } },
--     endwise = { enable = true },
-- }
require("nvim-treesitter").install({ "bash", "html", "lua", "markdown", "vim", "vimdoc", "ruby", "go" })
vim.filetype.add({ extension = { mdx = "markdown" } })

vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
      local ts = require("nvim-treesitter")
      local installed = ts.get_installed()
      if vim.tbl_contains(installed, vim.bo.filetype) then
          vim.treesitter.start()

          -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          -- if vim.bo.filetype == 'ruby' then
          --     vim.bo[event.buf].syntax = 'ON'
          -- end
      end
  end,
})
