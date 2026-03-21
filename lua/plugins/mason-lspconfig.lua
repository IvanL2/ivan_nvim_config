return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "verible", "lua_ls", "basedpyright" },
      automatic_enable = {
        exclude = {
          "verible" -- we only need it for format, NOT ls
        }
      }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    }
  }
}
