-- MAPS:

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false


vim.opt.number = true

vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false


vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)


vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.opt.signcolumn = 'yes'


vim.opt.updatetime = 250


vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true


vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }


vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })



-- Lazy


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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {

    { import = "plugins" },
  },
 
  checker = { enabled = true },
})


