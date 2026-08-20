return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = { preset = "enter" },
    -- <leader>tc toggles drill mode: completion off, the friction is the point
    enabled = function()
      return not vim.g.drill_mode
    end,
  },
}
