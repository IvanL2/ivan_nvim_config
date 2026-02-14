return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
  },

  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }

    local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      vim.lsp.config(ls,
        { capabilities = capabilities }
      )
    end

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })

    local verible_lint_rules = [[
      -line-length,
      -macro-name-style,
      -explicit-parameter-storage-type
      +parameter-name-style="localparam_style:ALL_CAPS,parameter_style:ALL_CAPS",
      -generate-label-prefix,
      +explicit-begin,
      -constraint-name-style,
      +interface-name-style="[a-z_0-9]+((_if)|(_intf))",
      +legacy-generate-region,
      +numeric-format-string-style,
      -struct-union-name-style,
      +suspicious-semicolon
    ]]

    vim.lsp.config("verible", {
      cmd = {
        "verible-verilog-ls",
        "--indentation_spaces", "4",
        "--rules=" .. verible_lint_rules,
        "--lsp_enable_hover",
        "--assignment_statement_alignment=align",
        "--case_items_alignment=align",
        "--enum_assignment_statement_alignment=align",
        "--formal_parameters_alignment=align",
        "--formal_parameters_indentation=indent",
        "--module_net_variable_alignment=align",
        "--named_parameter_indentation=indent",
        "--named_port_alignment=align",
        "--named_port_indentation=indent",
        "--port_declarations_alignment=align",
        "--port_declarations_indentation=indent",
        "--struct_union_members_alignment=align",
        "--port_declarations_right_align_packed_dimensions=false",
        "--port_declarations_right_align_unpacked_dimensions=false"
      }
    })
  end
}
