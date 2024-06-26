local null_ls = require "null-ls"
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,                                                              -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "svelte" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.black,
  -- b.diagnostics.mypy,
  b.diagnostics.ruff,
  -- b.diagnostics.pylint

  -- go
  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
  b.formatting.golines,

  -- sql
  b.formatting.sql_formatter.with {
    command = { "sleek" },
    filetypes = { "sql", "msql", "plsql" },
  },
}

null_ls.setup({
  sources = sources
})

-- local function format_on_save()
--   null_ls.setup {
--     debug = true,
--     sources = sources,
--     on_attach = function(client, bufnr)
--       if client.supports_method "textDocument/formatting" then
--         vim.api.nvim_clear_autocmds {
--           group = augroup,
--           buffer = bufnr,
--         }
--
--         vim.api.nvim_create_autocmd("BufWritePre", {
--           group = augroup,
--           buffer = bufnr,
--           callback = function()
--             vim.lsp.buf.format { bufnr = bufnr }
--           end,
--         })
--       end
--     end,
--   }
-- end
--
-- format_on_save()
