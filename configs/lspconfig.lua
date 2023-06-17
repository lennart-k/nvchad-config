local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        buildScripts = {
          enable = true
        }
      },
      procMacro = {
        enable = true
      },
      inlayHints = {
        bindingModeHints = {
          enable = true
        }
      },
    }
  },
  root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  root_dir = lspconfig.util.root_pattern("setup.py")
})

lspconfig.svelte.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"svelte"},
  root_dir = lspconfig.util.root_pattern("package.json")
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"typescript"},
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")
})

lspconfig.texlab.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"tex", "bib", "plaintext"},
})

lspconfig.ltex.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"tex", "plaintext", "markdown"},
})

lspconfig.typst_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("*.typ")
})

lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(fname)
    return lspconfig.util.find_git_ancestor(fname)
  end,
  single_file_support = true,
  filetypes = { "astro", "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue" }
})
