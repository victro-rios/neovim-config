-- capabilities for all servers
local caps = require("cmp_nvim_lsp").default_capabilities()

-- your lua_ls setup should include: capabilities = caps
-- example with the new API:
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.lsp.start(vim.lsp.config.lua_ls({
      cmd = { "lua-language-server" },
      capabilities = caps,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
        },
      },
    }))
  end,
})

-- nvim-cmp
local cmp = require("cmp")
cmp.setup({
  snippet = { expand = function(a) require("luasnip").lsp_expand(a.body) end },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})
