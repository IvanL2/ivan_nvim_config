vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.list = true
vim.opt.sidescroll = 20
vim.opt.sidescrolloff = 2
vim.opt.lcs = vim.o.lcs .. ",precedes:<,extends:>"

vim.opt.showtabline = 2
vim.opt.termguicolors = true


vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.sv,*.v",
  callback = function()
    -- Hack for slang-server - it only re-elaborates on save. My workflow
    -- involves RO files (which obv can't be saved), so simply fake a
    -- save every time I open a buffer.
    vim.api.nvim_exec_autocmds("BufWritePost", { buffer = 0 })
  end
})
