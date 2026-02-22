local verible_stuff = {}

local function concat_lists(...)
  local result = {}
  for _, t in ipairs({ ... }) do
    for _, v in ipairs(t) do
      table.insert(result, v)
    end
  end
  return result
end

verible_stuff.lint_rules = [[
    -line-length,
    -macro-name-style,
    -explicit-parameter-storage-type,
    +parameter-name-style="localparam_style:ALL_CAPS;parameter_style:ALL_CAPS",
    -generate-label-prefix,
    +explicit-begin,
    -constraint-name-style,
    +interface-name-style="[a-z_0-9]+((_if)|(_intf))",
    +legacy-generate-region,
    +numeric-format-string-style,
    -struct-union-name-style,
    +suspicious-semicolon ]]

verible_stuff.indent_spaces = 3
verible_stuff.column_limit = 120
verible_stuff.wrap_spaces = 0

verible_stuff.format_args = {
  "--indentation_spaces", verible_stuff.indent_spaces,
  "--column_limit=" .. verible_stuff.column_limit,
  "--wrap_spaces=" .. verible_stuff.wrap_spaces,
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
  "--try_wrap_long_lines=false",
  "--port_declarations_right_align_packed_dimensions=false",
  "--port_declarations_right_align_unpacked_dimensions=false"
}

verible_stuff.ls_args = concat_lists({
  "--rules=" .. verible_stuff.lint_rules,
  "--lsp_enable_hover",
}, verible_stuff.format_args)

verible_stuff.ls_cmd = concat_lists({
  "verible-verilog-ls"
}, verible_stuff.ls_args)

verible_stuff.formatter_args = concat_lists(
  verible_stuff.format_args,
  { "-" }
)
verible_stuff.format_cmd = concat_lists({
  "verible-verilog-format",
}, verible_stuff.format_args)

return verible_stuff
