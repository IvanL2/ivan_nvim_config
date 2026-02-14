vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { silent = true })
vim.keymap.set({ "n", "x" }, "<leader>d", '"+d', { silent = true })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { silent = true })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { silent = true })
vim.keymap.set({ "n", "x" }, "<C-n>", "<cmd>tabnew<cr>")

local nvimtree_api = require("nvim-tree.api")
vim.keymap.set({ "n", "x" }, "<leader>t", nvimtree_api.tree.toggle, { silent = true, noremap = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })

local aerial = require("aerial")
local telescope = require("telescope")
vim.keymap.set("n", "<leader>o", aerial.toggle, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>O", telescope.extensions.aerial.aerial, { silent = true, noremap = true })
-- lsp binds (other than defaults)
local bufopts = { silent = true, noremap = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, bufopts)
vim.keymap.set('n', '<leader>h', '<cmd>LspClangdSwitchSourceHeader<CR>', bufopts)

-- leap
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
