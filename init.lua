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
-- adjustments for verilog
vim.api.nvim_set_hl(0, "@keyword.directive.verilog", { fg = "#DC6068" })
vim.api.nvim_set_hl(0, "@keyword.directive.define.verilog", { fg = "#DC6068" })

-- bufferline (tabs) setup
vim.opt.termguicolors = true
require("bufferline").setup {}

-- nvim-tree setup
require("nvim-tree").setup()

-- telescope keybinds setup
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- verible lsp config
vim.lsp.config('verible', {
    cmd = { 'verible-verilog-ls', '--indentation_spaces', '4', '--rules=-line-length,-macro-name-style,-explicit-parameter-storage-type,+parameter-name-style="localparam_style:ALL_CAPS"'}
})

-- lsp binds (other than defaults)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, bufopts)
