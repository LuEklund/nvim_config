return {
  "brenton-leighton/multiple-cursors.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      mode = { "n", "v" },
      "<Leader>ma",
      "<cmd>MultipleCursorsAddMatches<cr>",
      desc = "Multi-cursor add matches",
    },
    {
      mode = { "n", "v" },
      "<C-x>",
      "<cmd>MultipleCursorsAddDown<cr>",
      desc = "Multi-cursor add down",
    },
    {
      mode = { "n", "v" },
      "<C-p>",
      "<cmd>MultipleCursorsAddUp<cr>",
      desc = "Multi-cursor add up",
    },
    {
      mode = "n",
      "<C-n>",
      "<cmd>MultipleCursorsAddJumpNextMatch<cr>",
      desc = "Multi-cursor add jump next match",
    },
    {
      mode = "n",
      "<Leader>mm",
      "<cmd>MultipleCursorsMouseAddDelete<cr>",
      desc = "Multi-cursor mouse add/delete",
    },
  },
}