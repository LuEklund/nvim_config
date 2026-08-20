return {
  "kawre/leetcode.nvim",
  lazy = "leetcode.nvim" ~= vim.fn.argv(0, -1),
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    arg = "leetcode.nvim", -- launch drills with: nvim leetcode.nvim
    lang = "cpp",
    picker = { provider = "fzf-lua" },
  },
  config = function(_, opts)
    require("leetcode").setup(opts)

    -- run/submit binds only in leetcode scratch buffers
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = vim.fn.stdpath("data") .. "/leetcode/*",
      callback = function(ev)
        local set = function(lhs, cmd, desc)
          vim.keymap.set("n", lhs, "<cmd>Leet " .. cmd .. "<cr>", { buffer = ev.buf, desc = desc })
        end
        set("<leader>r", "run", "Leet run")
        set("<leader>s", "submit", "Leet submit")
        set("<leader>i", "console", "Leet console")
      end,
    })
  end,
}
