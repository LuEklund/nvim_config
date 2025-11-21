vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Force these highlights to override everything
    vim.api.nvim_set_hl(0, "@variable", { fg = "#5ccfe6" })
    vim.api.nvim_set_hl(0, "@variable.member", { fg = "#ff9e64" })
  end,
})