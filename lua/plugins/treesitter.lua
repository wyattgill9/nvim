return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            semantic_tokens = true,

            ensure_installed = {
                "json",
                "typescript",
                "markdown",
                "lua",
                "c",
                "rust",
                "cpp",
            },
        })
    end,
}
