return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "default",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      on_colors = function(colors)
        colors.bg = "#000000"
        colors.bg_dark = "#000000"
        colors.bg_float = "#000000"
        colors.bg_highlight = "#1a1a1a"
        colors.bg_popup = "#000000"
        colors.bg_search = "#1a1a1a"
        colors.bg_sidebar = "#000000"
        colors.bg_statusline = "#000000"
        colors.bg_visual = "#1a1a1a"
      end,
      on_highlights = function(highlights, colors)
        highlights["@lsp.type.property.zig"] = { fg = "#9cDCFE", force = true }
        highlights["@lsp.typemod.property.declaration.zig"] = { fg = "#9cDCFE", force = true }
        highlights["@variable"] = { fg = "#5ccfe6", force = true }
        highlights["@variable.member"] = { fg = "#ff9e64", force = true }
        highlights["@keyword.import"] = { fg = "#D2B48C" }
        highlights["@type"] = { fg = "#4EC9B0" }
        highlights["@string"] = { fg = "#CE9178" }
        highlights["@keyword"] = { fg = "#006dff" }
        highlights["@function"] = { fg = "#DCDCAA" }
        highlights["@operator"] = { fg = "#d68080" }
        highlights["@constant"] = { fg = "#5fa3ff" }
        highlights["@constant.builtin"] = { fg = "#036fff" }
        highlights["@keyword.conditional"] = { fg = "#ff8080", force = true }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
