-- PLUGINS AND WHY:
-- LSP/TREESITTER/CMP
-- Oil - system file explorer
-- Telescope - fuzzy finder
-- tokyonight - colorscheme

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<Leader>c', 'gcc', { remap = true, desc = 'Toggle comment' })
vim.keymap.set('v', '<Leader>c', 'gc', { remap = true, desc = 'Toggle comment' })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set('n', '<Leader>f', '<cmd>Telescope find_files<CR>', { desc = 'Find File' })
vim.keymap.set('n', '<Leader>g', '<cmd>Telescope live_grep_args<CR>', { desc = 'Live Grep Args' })
vim.keymap.set('n', '<Leader>p', '<cmd>Telescope oldfiles<CR>', { desc = 'Recent Files' })

vim.keymap.set('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
vim.keymap.set('n', '<Leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Show hover info' })

vim.opt.clipboard = 'unnamedplus'

vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.cursorline = true
vim.o.relativenumber = true

vim.cmd("autocmd BufNewFile,BufRead *.v set filetype=verilog")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true },
})
