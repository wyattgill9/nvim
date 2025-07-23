return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.zls.setup({
        capabilities = capabilites
      })
    end,
  },
}
