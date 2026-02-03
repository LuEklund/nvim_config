return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "FloatBorder",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "TelescopeNormal",
          "WhichKeyFloat",
        },
      })
    end,
  },
}
