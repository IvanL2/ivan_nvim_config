return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  branch = "master",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "vim", "vimdoc",              -- nvim core
      "c", "cpp", "cmake",                 -- embedded
      "ocaml", "ocaml_interface",          -- goat
      "python",
      "verilog", "tcl", "bash"             -- VLSI
    },
    install_strategy = "prefer_git",
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true }
  }
}
