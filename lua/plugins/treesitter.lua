return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  branch = "main",
  main = "nvim-treesitter.config",
  opts = {
    ensure_installed = {
      "vim", "vimdoc", "lua",              -- nvim core
      "c", "cpp", "cmake",                 -- embedded
      "ocaml", "ocaml_interface",          -- goat
      "python",
      "verilog", "tcl", "bash"             -- VLSI
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true }
  }
}
