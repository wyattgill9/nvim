-- MAPS:

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true

vim.opt.mouse = 'a'
vim.opt.showmode = false
-- Save undo history
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 4
vim.o.shiftwidth = 4

vim.o.expandtab = true

vim.opt.updatetime = 250


vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

-- CUSTOM MAPS:

vim.keymap.set('n', 'f', '<cmd>Telescope find_files<CR>', { desc = 'Find File' })

vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live Grep' })

vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find Buffer' })


vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap = true })


-- unbind arrow keys so i get better at vim:

vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true })



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


