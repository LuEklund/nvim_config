-- Multi-cursor using jake-stewart/multicursor.nvim
return {
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
}
