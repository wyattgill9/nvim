return {
  "mikavilpas/yazi.nvim",
  opts = {
    open_for_directories = false,  -- Set to true to open yazi instead of netrw for directories
    keymaps = {
      show_help = '<F1>',  -- Keybinding to show help within yazi
    },
  },
  keys = {
    {
      "<leader>-",
      "<cmd>Yazi<CR>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>cw",
      "<cmd>Yazi cwd<CR>",
      desc = "Open yazi in the current working directory",
    },
    {
      "<C-Up>",
      "<cmd>Yazi toggle<CR>",
      desc = "Resume the last yazi session",
    },
  },
}

