return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup()
  end,
  keys = {
    { "<leader>g", function() require("harpoon").add_file() end, desc = "Add file to Harpoon" },
    { "<leader>a", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon menu" },
    { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "Navigate to file 1" },
    { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "Navigate to file 2" },
    { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "Navigate to file 3" },
    { "<leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "Navigate to file 4" },
    { "<leader>5", function() require("harpoon.ui").nav_file(5) end, desc = "Navigate to file 5" },
  },
}

