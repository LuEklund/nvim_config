return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})

    local wk = require("which-key")
    wk.register({
      ["ga"] = { "<cmd>TextCaseOpenTelescope<CR>", "Change case" },
    })
  end,
  keys = {
    { "ga", mode = { "n", "v" }, desc = "Text case picker" },
  },
}
