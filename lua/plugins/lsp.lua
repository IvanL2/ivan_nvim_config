return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
  },

  config = function()
    local language_servers = { "clangd", "lua_ls", "verible", "basedpyright" } -- or list servers manually like {'gopls', 'clangd'}
    --
    -- for _, ls in ipairs(language_servers) do
    --   vim.lsp.config(ls,
    --     {
    --       capabilities = {
    --         textDocument = {
    --           foldingRange = {
    --             dynamicRegistration = false,
    --             lineFoldingOnly = true
    --           }
    --         }
    --       }
    --     }
    --   )
    -- end
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })

    vim.lsp.config("verible", {
      cmd = require("verible_stuff").ls_cmd })
  end
}
