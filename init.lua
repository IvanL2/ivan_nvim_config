-- Important vim init
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ","

-- other vim config
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.showtabline = 2
-- lazy plugin manager
require("config.lazy")

-- colourscheme
vim.cmd("colorscheme carbonfox")
-- adjustments for verilog
vim.api.nvim_set_hl(0, "@keyword.directive.verilog", { fg = "#DC6068" })
vim.api.nvim_set_hl(0, "@keyword.directive.define.verilog", { fg = "#DC6068" })

-- remap system clipboard yank/cut because "+y is painful
vim.keymap.set({"n", "x"}, "<leader>y", '"+y', { silent = true })
vim.keymap.set({"n", "x"}, "<leader>d", '"+d', { silent = true })
vim.keymap.set({"n", "x"}, "<leader>p", '"+p', { silent = true })
vim.keymap.set({"n", "x"}, "<leader>P", '"+P', { silent = true })

-- new tab
vim.keymap.set({"n", "x"}, "<C-n>", "<cmd>tabnew<cr>")
-- bufferline (tabs) setup
vim.opt.termguicolors = true
-- require("bufferline").setup {
--     options = {
--         mode = "tabs"
--     }
-- }

-- nvim-tree setup
require("nvim-tree").setup()

-- telescope native extension
require('telescope').setup {
    extensions = {
        fzf = {}
    }
}
require('telescope').load_extension('fzf')
-- telescope keybinds setup
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- verible lsp config
vim.lsp.config('verible', {
    cmd = { 'verible-verilog-ls', '--indentation_spaces', '4', '--rules=-line-length,-macro-name-style,-explicit-parameter-storage-type,+parameter-name-style="localparam_style:ALL_CAPS"', '--lsp_enable_hover'}
})

-- ufo (folding) config
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
    })
end
require('ufo').setup()

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
