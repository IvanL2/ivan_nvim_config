vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ","

require("lua.options")

-- lazy plugin manager
require("config.lazy")

vim.cmd("colorscheme carbonfox")
vim.api.nvim_set_hl(0, "@keyword.directive.verilog", { fg = "#DC6068" })
vim.api.nvim_set_hl(0, "@keyword.directive.define.verilog", { fg = "#DC6068" })

-- Personal per-device config
local res, mod = pcall(require, "config.ivan_local_config")
if (res and mod) then
  mod.local_config()
end

-- Load last, as depends on plugins
require("lua.keybinds")
