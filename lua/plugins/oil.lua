return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.Add commentMore actions
  lazy = false,
  keys = {
    {
      "<leader>-",
      "<cmd>Oil<CR>",
      desc = "Open Oil at the current file",
    },
  },
}
