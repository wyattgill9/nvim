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

-- PERFORMANCE OPTIMIZATION
-- Disable unused built-in plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
-- vim.g.loaded_logipat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-- Set updatetime for faster response
vim.opt.updatetime = 100

-- CUSTOM MAPS FOR SPEED
-- Telescope speed improvements
vim.keymap.set('n', 'f', '<cmd>Telescope find_files<CR>', { desc = 'Find File' })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep_args<CR>', { desc = 'Live Grep Args' }) -- Using LGA for better performance
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find Buffer' })
vim.keymap.set('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Help Tags' })
vim.keymap.set('n', '<Leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Recent Files' })

-- Quick save and quit
vim.keymap.set('n', '<Leader>w', '<cmd>write<CR>', { noremap = true, desc = 'Quick save' })
vim.keymap.set('n', '<Leader>q', '<cmd>quit<CR>', { noremap = true, desc = 'Quick quit' })
vim.keymap.set('n', '<Leader>x', '<cmd>write<CR><cmd>quit<CR>', { noremap = true, desc = 'Save and quit' })

-- Toggle file explorer (using NvimTree)
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap = true })


-- DISABLE ARROW KEYS (Force hjkl usage)
vim.keymap.set('', '<Up>', '<Nop>', { noremap = true })
vim.keymap.set('', '<Down>', '<Nop>', { noremap = true })
vim.keymap.set('', '<Left>', '<Nop>', { noremap = true })
vim.keymap.set('', '<Right>', '<Nop>', { noremap = true })

-- Quick harpoon integration
vim.keymap.set('n', '<Leader>a', '<cmd>lua require("harpoon.mark").add_file()<CR>', { desc = 'Harpoon add file' })
vim.keymap.set('n', '<Leader>h', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = 'Harpoon menu' })
vim.keymap.set('n', '<Leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', { desc = 'Harpoon file 1' })
vim.keymap.set('n', '<Leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', { desc = 'Harpoon file 2' })

-- Zen mode toggle
vim.keymap.set('n', '<Leader>z', '<cmd>ZenMode<CR>', { noremap = true, desc = 'Toggle Zen Mode' })

-- LSP shortcuts
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Go to references' })
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Show hover info' })
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename symbol' })

-- Quick comment toggle (using normal mode)
vim.keymap.set('n', '<Leader>c', 'gcc', { remap = true, desc = 'Toggle comment' })
vim.keymap.set('v', '<Leader>c', 'gc', { remap = true, desc = 'Toggle comment' })

-- Filetype detection
vim.cmd("autocmd BufNewFile,BufRead *.v set filetype=verilog")

-- NO MORE MOUSEY

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


