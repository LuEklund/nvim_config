return {
  -- Free <leader>d for a Helix-style diagnostics picker by removing LazyVim's
  -- "+debug"/"+profiler" which-key groups (real keymaps removed in keymaps.lua).
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = vim.tbl_filter(function(s)
        return not (s[1] == "<leader>d" or s[1] == "<leader>dp")
      end, opts.spec or {})
    end,
  },
  -- The profiler scratch key is a lazy-loaded plugin key; disable it too.
  {
    "folke/snacks.nvim",
    keys = { { "<leader>dps", false } },
  },
}
