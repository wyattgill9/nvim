vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Quick comment toggle (using normal mode)
vim.keymap.set('n', '<Leader>c', 'gcc', { remap = true, desc = 'Toggle comment' })
vim.keymap.set('v', '<Leader>c', 'gc', { remap = true, desc = 'Toggle comment' })

-- Center cursor on search
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search Ops
vim.opt.ignorecase = true

-- Telescope
vim.keymap.set('n', '<Leader>f', '<cmd>Telescope find_files<CR>', { desc = 'Find File' })
vim.keymap.set('n', '<Leader>g', '<cmd>Telescope live_grep_args<CR>', { desc = 'Live Grep Args' }) -- Using LGA for better performance
vim.keymap.set('n', '<Leader>b', '<cmd>Telescope buffers<CR>', { desc = 'Find Buffer' })
vim.keymap.set('n', '<Leader>h', '<cmd>Telescope help_tags<CR>', { desc = 'Help Tags' })
vim.keymap.set('n', '<Leader>p', '<cmd>Telescope oldfiles<CR>', { desc = 'Recent Files' })

vim.keymap.set('n', '<Leader>w', '<cmd>write<CR>', { noremap = true, desc = 'Quick save' })
vim.keymap.set('n', '<Leader>q', '<cmd>write<CR><cmd>quit<CR>', { noremap = true, desc = 'Quick quit' })

vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
vim.keymap.set('n', '<Leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Show hover info' })
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename symbol' })
vim.keymap.set('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code actions' })

vim.opt.clipboard = 'unnamedplus'

vim.opt.swapfile = false
vim.opt.number = true
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.o.relativenumber = true

-- Verilog
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
