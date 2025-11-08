-- Enable the server by name (Neovim 0.11+)
vim.lsp.enable('gopls')

-- Configure gopls
vim.lsp.config('gopls', {
  cmd = { 'gopls' },                                  -- make sure `gopls` is on PATH
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },   -- common Go filetypes
  root_markers = { 'go.work', 'go.mod', '.git' },      -- project root hints
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unreachable  = true,
      },
      staticcheck = true,   -- extra checks
      gofumpt     = true,   -- stricter formatting
      -- hints = { parameterNames = true }, -- uncomment if you want inlay hints (requires newer gopls)
    },
  },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function(args)
    vim.lsp.buf.format({ async = false, bufnr = args.buf })
  end,
})
