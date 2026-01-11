return {
  {
    "ggandor/leap.nvim",
    config = function()
      local leap = require("leap") -- get the module
      leap.opts.case_sensitive = true -- set option

      -- First, unmap the built-in S
      vim.api.nvim_del_keymap("n", "S")
    end,
  },
}
