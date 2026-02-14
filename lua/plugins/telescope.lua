return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/aerial.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      extensions = {
        fzf = {},
        aerial = {}
      },
      defaults = {
        path_display = { "smart " },
        layout_strategy = "vertical"
      }
    }
    telescope.load_extension('fzf')
    telescope.load_extension("aerial")
  end
}
