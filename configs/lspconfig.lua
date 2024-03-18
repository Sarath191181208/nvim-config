local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "tailwindcss", "dartls", "htmx"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  single_file_support = true,
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
}

lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "svelte" },
  root_dir = util.root_pattern("package.json", ".git"),
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python", "py" },
  root_dir = util.root_pattern(".py", ".git"),
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

-- print(util.root_pattern("Cargo.toml")());

-- lspconfig.rust_analyzer.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {"rust"},
--     root_dir = util.root_pattern("Cargo.toml"),
--     settings = {
--       ['rust-analyzer'] = {
--         cargo = {
--             allFeatures = true
--         }
--       }
--     }
-- }
--
-- lspconfig.pyright.setup { blabla}
