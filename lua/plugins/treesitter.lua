return {
  "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "rust", "python", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "nim", "gleam", "cpp"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
          })
      end 
}