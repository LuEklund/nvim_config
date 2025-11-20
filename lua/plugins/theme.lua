return {
  -- Simple high contrast theme
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 0,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = false,
          styles = {
            comments = "italic",
          },
        },
        palettes = {
          dark_high_contrast = {
            bg = "#000000",
            bg_statusline = "#000000",
            bg_visual = "#1a1a1a",
            bg_search = "#1a1a1a",
          },
        },
      })

      -- Apply colorscheme after setup
      vim.cmd("colorscheme github_dark_high_contrast")

      -- Apply custom highlights after colorscheme is loaded
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          -- Basic syntax colors
          vim.api.nvim_set_hl(0, "Function", { fg = "#FF0000", bold = true })
          vim.api.nvim_set_hl(0, "Identifier", { fg = "#87CEEB" })
          vim.api.nvim_set_hl(0, "Type", { fg = "#4169E1", bold = true })
          vim.api.nvim_set_hl(0, "Keyword", { fg = "#4169E1", bold = true })
          vim.api.nvim_set_hl(0, "String", { fg = "#F1FA8C" })
          vim.api.nvim_set_hl(0, "Comment", { fg = "#6272A4", italic = true })
          vim.api.nvim_set_hl(0, "Number", { fg = "#BD93F9" })
          vim.api.nvim_set_hl(0, "Operator", { fg = "#FF79C6" })
          vim.api.nvim_set_hl(0, "Constant", { fg = "#8BE9FD" })

          -- Tree-sitter highlights
          vim.api.nvim_set_hl(0, "@function", { fg = "#FFD700", bold = true })
          vim.api.nvim_set_hl(0, "@function.call", { fg = "#FFD700" })
          vim.api.nvim_set_hl(0, "@method", { fg = "#FFD700", bold = true })
          vim.api.nvim_set_hl(0, "@method.call", { fg = "#FFD700" })
          vim.api.nvim_set_hl(0, "@variable", { fg = "#87CEEB" })
          vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#87CEEB" })
          vim.api.nvim_set_hl(0, "@variable.member", { fg = "#87CEEB" })
          vim.api.nvim_set_hl(0, "@type", { fg = "#4169E1", bold = true })
          vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#1E90FF" })
          vim.api.nvim_set_hl(0, "@keyword", { fg = "#4169E1", bold = true })
          vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#4169E1", bold = true })
          vim.api.nvim_set_hl(0, "@keyword.storage", { fg = "#4169E1", bold = true })
          vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#FF79C6", bold = true })
          vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#FF79C6", bold = true })
          vim.api.nvim_set_hl(0, "@keyword.exception", { fg = "#FF79C6", bold = true })
          vim.api.nvim_set_hl(0, "@string", { fg = "#F1FA8C" })
          vim.api.nvim_set_hl(0, "@string.documentation", { fg = "#8BE9FD", italic = true })
          vim.api.nvim_set_hl(0, "@comment", { fg = "#6272A4", italic = true })
          vim.api.nvim_set_hl(0, "@comment.documentation", { fg = "#8BE9FD", italic = true })
          vim.api.nvim_set_hl(0, "@number", { fg = "#BD93F9" })
          vim.api.nvim_set_hl(0, "@boolean", { fg = "#BD93F9" })
          vim.api.nvim_set_hl(0, "@constant", { fg = "#8BE9FD" })
          vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#8BE9FD" })
          vim.api.nvim_set_hl(0, "@operator", { fg = "#FF79C6" })
          vim.api.nvim_set_hl(0, "@attribute", { fg = "#F1FA8C" })
          vim.api.nvim_set_hl(0, "@field", { fg = "#87CEEB" })
          vim.api.nvim_set_hl(0, "@property", { fg = "#87CEEB" })

          -- UI elements
          vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#F8F8F2" })
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF", bg = "#1a1a1a" })
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#6272A4" })
          vim.api.nvim_set_hl(0, "Visual", { bg = "#1a1a1a" })
        end,
        pattern = "*",
      })
    end,
  },
}

