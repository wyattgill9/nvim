return {
--   {
--    "3rd/image.nvim",
--    lazy = true,
--    },

    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    },

    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
        -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_view_forward_search_on_start = false
            vim.g.vimtex_compiler_latexmk = {
                aux_dir = "/home/oscar/.texfiles/",
                out_dir = "/home/oscar/.texfiles/"
            }
        end
    }
}
