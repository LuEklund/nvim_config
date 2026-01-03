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
            ["@type"] = { fg = "#4EC9B0" },
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

            -- constants / numbers
            ["@constant"] = { fg = "#4FC1FF" },
            ["@constant.builtin"] = { fg = "#C586C0" },
            ["@number"] = { fg = "#B5CEA8" },

            -- strings
            ["@string"] = { fg = "#CE9178" },

            -- operators
            ["@operator"] = { fg = "#D4D4D4" },
          }
        end,
      })

      vim.cmd("colorscheme catppuccin")
    end,
  },
}
