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
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.wrap = false
vim.o.list = true
vim.o.sidescroll = 20
vim.o.sidescrolloff = 2
vim.o.lcs = vim.o.lcs .. ",precedes:<,extends:>"

vim.o.showtabline = 2
-- lazy plugin manager
require("config.lazy")

-- colourscheme
vim.cmd("colorscheme carbonfox")
-- adjustments for verilog
vim.api.nvim_set_hl(0, "@keyword.directive.verilog", { fg = "#DC6068" })
vim.api.nvim_set_hl(0, "@keyword.directive.define.verilog", { fg = "#DC6068" })

-- remap system clipboard yank/cut because "+y is painful
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { silent = true })
vim.keymap.set({ "n", "x" }, "<leader>d", '"+d', { silent = true })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { silent = true })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { silent = true })

-- new tab
vim.keymap.set({ "n", "x" }, "<C-n>", "<cmd>tabnew<cr>")
vim.opt.termguicolors = true

-- Personal per-device config
local res, mod = pcall(require, "config.ivan_local_config")
if (res and mod) then
    mod.local_config()
end

-- nvim-tree setup
local nvimtree = require("nvim-tree")
local nvimtree_api = require("nvim-tree.api")
nvimtree.setup()
vim.keymap.set({"n","x"}, "<leader>t", nvimtree_api.tree.toggle, { silent = true, noremap = true })


-- telescope native extension
require('telescope').setup {
    extensions = {
        fzf = {}
    },
    defaults = {
        path_display = { "smart " },
        layout_strategy = "vertical"
    }
}
require('telescope').load_extension('fzf')

-- telescope keybinds setup
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })

-- verible lsp config
vim.lsp.config('verible', {
    cmd = {
        'verible-verilog-ls',
        -- '--flagfile=/nfs/site/home/ily/.config/verible/flags.txt'
        '--indentation_spaces', '4',
        '--rules=-line-length,-macro-name-style,-explicit-parameter-storage-type,+parameter-name-style="localparam_style:ALL_CAPS",-generate-label-prefix,+endif-comment,+explicit-begin',
        '--lsp_enable_hover',
        '--assignment_statement_alignment=align',
        '--case_items_alignment=align',
        '--enum_assignment_statement_alignment=align',
        '--formal_parameters_alignment=align',
        '--formal_parameters_indentation=indent',
        '--module_net_variable_alignment=align',
        '--named_parameter_indentation=indent',
        '--named_port_alignment=align',
        '--named_port_indentation=indent',
        '--port_declarations_alignment=align',
        '--port_declarations_indentation=indent',
        '--struct_union_members_alignment=align',
        '--port_declarations_right_align_packed_dimensions=false',
        '--port_declarations_right_align_unpacked_dimensions=false'
    }
})

-- vim.lsp.config("clangd", {
--     cmd = { "clangd", "--log=verbose" }
-- })

-- ufo (folding) config
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    vim.lsp.config(ls,
        { capabilities = capabilities }
    )
end
require('ufo').setup()

-- lsp binds (other than defaults)
local bufopts = { silent = true, noremap = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, bufopts)

-- leap
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')

-- outline
local outline = require("outline")
outline.setup()
vim.keymap.set({'n', 'x', 'o'}, '<leader>o', outline.toggle, bufopts)

require("mason-lspconfig").setup()

