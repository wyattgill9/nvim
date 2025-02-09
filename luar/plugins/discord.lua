return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  config = function()
      vim.cmd("echo 'Plugin Loaded!'") 
  end
}

