-- Ensure Mason-installed LSP binaries are visible
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "lua_ls", "ts_ls" },   -- mason will auto-install these
})
