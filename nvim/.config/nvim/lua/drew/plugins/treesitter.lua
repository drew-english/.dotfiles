vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/RRethy/nvim-treesitter-endwise",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
})

require("nvim-treesitter").install({ "bash", "html", "lua", "markdown", "vim", "vimdoc", "ruby", "go", "gomod", "yaml" })
vim.filetype.add({ extension = { mdx = "markdown" } })

vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
      local ts = require("nvim-treesitter")
      local installed = ts.get_installed()
      local additional_fts = { "sh", "javascriptreact" }
      local enabled_fts = vim.list_extend(installed, additional_fts)

      if vim.tbl_contains(enabled_fts, vim.bo.filetype) then
          vim.treesitter.start()

          vim.wo[0][0].foldenable = false
          vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.wo[0][0].foldmethod = 'expr'
          if vim.bo.filetype == 'ruby' then
              vim.bo[event.buf].syntax = 'ON'
          end
      end
  end,
})
