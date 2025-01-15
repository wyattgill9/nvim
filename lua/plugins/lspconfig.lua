return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    lazy = false,
    config = function()
        local nvim_lsp = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        local protocol = require("vim.lsp.protocol")

        local on_attach = function(client, bufnr)
            -- format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        mason_lspconfig.setup_handlers {
            function(server)
                nvim_lsp[server].setup({
                    capabilities = capabilities,
                })
            end,
            ["rust_analyzer"] = function()
                nvim_lsp["rust_analyzer"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["gopls"] = function()
                nvim_lsp["gopls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,     
        }
    end,
}