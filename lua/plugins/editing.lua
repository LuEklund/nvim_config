return {
  {
    url = "https://codeberg.org/andyg/leap.nvim.git",
    config = function()
      local leap = require("leap")
      leap.opts.case_sensitive = true
      leap.add_default_mappings()
      -- keep native S (change line); leap stays on s
      for _, mode in ipairs({ "n", "x", "o" }) do
        pcall(vim.keymap.del, mode, "S")
      end
    end,
  },

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "VeryLazy",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set
      set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end)
      set({ "n", "x" }, "<C-x>", function() mc.matchSkipCursor(1) end)
      set({ "n", "x" }, "<C-p>", function() mc.matchAddCursor(-1) end)
      set({ "n", "x" }, "<Leader>ma", mc.matchAllAddCursors)

      mc.addKeymapLayer(function(layerSet)
        layerSet("n", "<esc>", mc.clearCursors)
      end)
    end,
  },

  {
    "johmsalas/text-case.nvim",
    opts = { prefix = "ga" },
    keys = { { "ga", mode = { "n", "v" }, desc = "Text case" } },
  },
}
