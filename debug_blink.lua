-- Debug script to check blink.cmp keymap state
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    -- Wait a bit for blink.cmp to apply keymaps
    vim.defer_fn(function()
      print("=== Insert mode keymaps for <CR> ===")
      local cr_keymaps = vim.api.nvim_buf_get_keymap(0, 'i')
      for _, km in ipairs(cr_keymaps) do
        local key = km.lhs
        local decoded = vim.fn.keytrans(key)
        if decoded == "<CR>" or key == "<CR>" then
          print(string.format("Key: %s (decoded: %s), RHS: %s, desc: %s, callback: %s",
            key, decoded, km.rhs or "nil", km.desc or "nil", km.callback and "yes" or "no"))
        end
      end
    end, 100)
  end,
  once = true,
})
