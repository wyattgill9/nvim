return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  lazy = false,
  keys = {
    {
      "<leader>-",
      "<cmd>Oil<CR>",
      desc = "Open Oil at the current file",
    },
  },
}
