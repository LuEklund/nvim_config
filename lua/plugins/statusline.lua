return {
  -- Override LazyVim's statusline config
  {
    "LazyVim/LazyVim",
    opts = {
      -- Disable the datetime component in lualine
      statusline = {
        lualine = {
          sections = {
            lualine_x = {},
          },
        },
      },
    },
  },
}