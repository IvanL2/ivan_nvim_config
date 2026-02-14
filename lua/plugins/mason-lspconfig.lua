return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "verible", "lua_ls", "basedpyright" }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    }
  }
}
