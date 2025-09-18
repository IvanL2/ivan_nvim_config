-- Important vim init
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ","

-- other vim config
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- lazy plugin manager
require("config.lazy")

-- colourscheme
vim.g.material_style = "deep ocean"
vim.cmd("colorscheme material")

-- bufferline (tabs) setup
vim.opt.termguicolors = true
require("bufferline").setup{}

-- nvim-tree setup
require("nvim-tree").setup()

-- telescope keybinds setup
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

