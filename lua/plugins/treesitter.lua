return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
                "vim","vimdoc","lua",
                "c","cpp","cmake",
                "ocaml","ocaml_interface",
                "python"
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true } 
    }
}

