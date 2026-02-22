return {
  'stevearc/conform.nvim',
  dependencies = {
    "neovim/nvim-lspconfig"
  },
  opts = {
    formatters_by_ft = {
      verilog = { "verible" },
      systemverilog = { "verible" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters = {
      verible = {
        inherit = false,
        command = "verible-verilog-format",
        args = require("verible_stuff").formatter_args
      }
    },
  },
}
