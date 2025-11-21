return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      highlights = {
        init = {
          ["@variable"] = { fg = "#5ccfe6" },
        },
      },
    },
  },

  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000", -- Pure black background
          mantle = "#000000",
          crust = "#000000",
        },
      },
      custom_highlights = function(colors)
        return {
          -- Force pure black backgrounds for all UI elements
          Normal = { bg = "#000000", fg = colors.text },
          NormalFloat = { bg = "#000000", fg = colors.text },
          NormalSB = { bg = "#000000", fg = colors.text },
          EndOfBuffer = { bg = "#000000", fg = "#000000" },
          CursorLine = { bg = "#1a1a1a" },
          CursorLineNr = { fg = colors.text, bg = "#1a1a1a" },
          LineNr = { fg = colors.surface1, bg = "#000000" },
          Visual = { bg = "#1a1a1a" },
          StatusLine = { bg = "#000000", fg = colors.text },
          StatusLineNC = { bg = "#000000", fg = colors.surface1 },
          TabLine = { bg = "#000000", fg = colors.surface1 },
          TabLineFill = { bg = "#000000", fg = "#000000" },
          TabLineSel = { bg = "#1a1a1a", fg = colors.text },
          SignColumn = { bg = "#000000" },
          FoldColumn = { bg = "#000000", fg = colors.surface1 },
          VertSplit = { bg = "#000000", fg = "#1a1a1a" },
          WinSeparator = { bg = "#000000", fg = "#1a1a1a" },
          Pmenu = { bg = "#000000", fg = colors.text },
          PmenuSel = { bg = "#1a1a1a", fg = colors.text },
          PmenuSbar = { bg = "#1a1a1a" },
          PmenuThumb = { bg = colors.surface1 },

          -- Tree-sitter syntax highlights
          -- ["@function"] = { fg = "#DCDCAA", bold = true },
          -- ["@function.call"] = { fg = "#DCDCAA" },
          -- ["@type"] = { fg = "#4EC9B0", bold = true },
          -- ["@type.builtin"] = { fg = "#1E90FF" },
          -- ["@keyword.conditional"] = { fg = "#C586C0", bold = true },
          -- ["@string"] = { fg = "#CE9178" },
          -- ["@string.documentation"] = { fg = "#6272A4", italic = true },
          -- ["@keyword.import"] = { fg = "#D2B48C" },
          -- ["@comment"] = { fg = "#6272A4", italic = true },
          -- ["@comment.documentation"] = { fg = "#6272A4", italic = true },
          -- ["@comment.todo"] = { fg = "#000000", bg = "#00FFFF", bold = true },
          -- ["@number"] = { fg = "#BD93F9" },
          -- ["@boolean"] = { fg = "#BD93F9" },
          -- ["@constant"] = { fg = "#8BE9FD" },
          -- ["@variable"] = { fg = "#9CDCFE" },
          ["@variable.member.zig"] = { fg = "#9CDCFE" },
          ["@variable.zig"] = { fg = "#9CDCFE" },
        }
      end,
      },
  },
}
