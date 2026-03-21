return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
  },

  config = function()
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })

    local slang_server_path_loc = vim.fs.joinpath(vim.fn.stdpath("config"), "slang_server_path.txt")
    local slang_server_path_fd = io.open(slang_server_path_loc, "r")
    if slang_server_path_fd then
      local slang_server_path = slang_server_path_fd:read("*a"):gsub("^%s*(.-)%s*$", "%1")
      slang_server_path_fd:close();

      vim.lsp.config("slang-server", {
        cmd = { slang_server_path },
        root_markers = { ".slang" },
        filetypes = {
          "systemverilog",
          "verilog",
        },
      })

      vim.lsp.enable("slang-server")
    end
  end
}
