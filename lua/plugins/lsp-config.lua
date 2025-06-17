return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ensure_installed = {
          "lua-language-server",
          "rust-analyzer",
          "clangd",
          "tl_ls",
          "zls"
        }

      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      -- lspconfig.hls.setup({
        -- capabilities = capabilities
      -- })
      lspconfig.zls.setup({
        capabilities = capabilites
      })
      -- lspconfig.astro.setup({
        -- capabilities = capabilities
      -- })
    end,
  },
}
