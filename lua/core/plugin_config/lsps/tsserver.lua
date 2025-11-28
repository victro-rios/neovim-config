-- Enable the server by name (Neovim 0.11+)
vim.lsp.enable('tsserver')

-- Configure tsserver
vim.lsp.config('tsserver', {
  cmd = { 'typescript-language-server', '--stdio' },   -- tsserver wrapper, must be on PATH
  filetypes = {
    'typescript', 'typescriptreact', 'typescript.tsx',
    'javascript', 'javascriptreact', 'javascript.jsx'
  },
  root_markers = {
    'tsconfig.json', 'package.json', 'jsconfig.json', '.git'
  },
  settings = {
    javascript = {
      format = {
        semicolons = "insert",
      },
    },
    typescript = {
      format = {
        semicolons = "insert",
      },
    },
  },
})

-- Format before save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
  callback = function(args)
    vim.lsp.buf.format({ async = false, bufnr = args.buf })
  end,
})
