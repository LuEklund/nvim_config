return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
    end,
  },
}
