return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        transparent_background = false,

        custom_highlights = function()
          return {
            -- comments
            Comment = { fg = "#6A9955", italic = true },

            -- keywords
            ["@keyword"] = { fg = "#569CD6" },
            ["@keyword.conditional"] = { fg = "#C586C0" },
            ["@keyword.return"] = { fg = "#569CD6" },

            -- types
            Type = { fg = "#4EC9B0" },
            ["@type"] = { fg = "#4EC9B0", bold = false },
            ["@type.builtin"] = { fg = "#4EC9B0" },

            -- Module
            ["@module"] = { fg = "#4ec98f", bold = true },

            -- functions
            ["@function"] = { fg = "#DCDCAA" },
            ["@function.call"] = { fg = "#DCDCAA" },
            ["@lsp.type.method.zig"] = { fg = "#DCDCAA", force = true },
            ["@method"] = { fg = "#DCDCAA" },

            -- variables
            ["@variable"] = { fg = "#9CDCFE" },
            ["@variable.builtin"] = { fg = "#C586C0", italic = true },
            ["@variable.member"] = { fg = "#9CDCFE" },
            ["@variable.parameter"] = { fg = "#e885e5" },

            -- LSP semantic tokens (override Treesitter)
            ["@lsp.type.property"] = { fg = "#9CDCFE", force = true },
            ["@lsp.type.variable"] = { fg = "#9CDCFE", force = true },
            -- zls emits "namespace" for struct types (structs are namespaces
            -- in zig); catppuccin's default lavender looks like variable blue
            ["@lsp.type.namespace.zig"] = { fg = "#4EC9B0", force = true },
            ["@lsp.type.struct.zig"] = { fg = "#4ec98f", bold = true, force = true },
            ["@lsp.type.type.zig"] = { fg = "#4ec98f", bold = true, force = true },
            ["@lsp.type.enum.zig"] = { fg = "#4ec98f", bold = true, force = true },

            -- constants / numbers
            ["@constant"] = { fg = "#4FC1FF" },
            ["@constant.builtin"] = { fg = "#C586C0" },
            ["@number"] = { fg = "#B5CEA8" },

            -- strings
            ["@string"] = { fg = "#CE9178" },

            -- operators
            ["@operator"] = { fg = "#D4D4D4" },

            -- bracket
            ["@punctuation.bracket"] = { fg = "#eea9fb" },
          }
        end,
      })

      vim.cmd("colorscheme catppuccin")
    end,
  },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 999,
    opts = {
      extra_groups = { "NormalFloat", "FloatBorder" },
    },
  },
}
