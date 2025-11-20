return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add zig to the list of installed parsers
    vim.list_extend(opts.ensure_installed, {
      "zig",
    })

    -- Enable custom highlights
    opts.highlight = {
      enable = true,
      custom_captures = {
        -- Function names (yellow beach)
        function_definition = "Function",
        function_call = "Function",
        method_definition = "Function",
        method_call = "Function",

        -- Variables (light blue)
        identifier = "Identifier",
        parameter = "Identifier",
        field_identifier = "Identifier",

        -- Types (blue)
        type_identifier = "Type",
        builtin_type = "Type",
        struct_type = "Type",
        enum_type = "Type",
        union_type = "Type",

        -- Keywords
        storage_modifier = "Keyword", -- pub, const, var, etc.
        control_keyword = "Conditional", -- if, else, while, for
        try_keyword = "Exception", -- try, catch
        defer_keyword = "Exception", -- defer, errdefer

        -- Zig-specific
        async_keyword = "Keyword", -- async, await
        comptime_keyword = "Keyword", -- comptime, nosuspend, suspend, resume
        builtin_function = "Function", -- @import, @cImport, etc.

        -- Literals
        string_literal = "String",
        char_literal = "Character",
        integer_literal = "Number",
        float_literal = "Float",
        boolean_literal = "Boolean",
        null_literal = "Constant",

        -- Comments
        line_comment = "Comment",
        doc_comment = "Comment",

        -- Error handling
        error_union = "Error",
        test_decl = "Function",

        -- Operators
        assignment_operator = "Operator",
        comparison_operator = "Operator",
        arrow_operator = "Operator",
        dot_operator = "Operator",

        -- Attributes
        attribute = "PreProc",
        export_keyword = "Keyword",
        extern_keyword = "StorageClass",
        inline_keyword = "StorageClass",
      },
    }
  end,
}