return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { 
          "nvim-telescope/telescope-live-grep-args.nvim" ,
          version = "^1.0.0",
      },
    },
    config = function()
      local telescope = require("telescope")
  
      telescope.setup({
          -- your config
      })
  
      telescope.load_extension("live_grep_args")
    end
}
