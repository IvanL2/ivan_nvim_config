return {
  'stevearc/aerial.nvim',
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    backends = { "lsp", "treesitter" },
    filter_kind = {
      systemverilog = false,
      cpp = { "Class", "Constructor", "Constant", "Enum", "Function", "Method", "Namespace", "Struct" },
    },
    highlight_closest = false,
    close_on_select = true,
  },
}
