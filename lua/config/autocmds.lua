vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
  pattern = "*.zig",
  callback = function()
    local lint = require("lint")
    local root = vim.fs.root(0, { "build.zig", ".git" }) or vim.loop.cwd()
    lint.lint(lint.linters.zig_build, { cwd = root })
  end,
})

-- ~/.config/nvim/lua/config/autocmds.lua

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- run after UI settles so window list is stable
    vim.schedule(function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_is_valid(win) then
          local buf = vim.api.nvim_win_get_buf(win)
          local ft = vim.bo[buf].filetype
          -- Only target the explorer, NOT snacks picker/dashboard/etc.
          if ft == "snacks_explorer" then
            pcall(vim.api.nvim_win_close, win, true)
          end
        end
      end
    end)
  end,
})
