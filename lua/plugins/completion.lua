-- Fix Enter key for blink.cmp completion confirmation
-- Debug version to see what's happening
return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- Ensure preset is "enter" which maps <CR> to accept with fallback
    opts.keymap.preset = "enter"

    local group = vim.api.nvim_create_augroup("BlinkCmpCrFix", { clear = true })

    -- Debug: Show all <CR> insert mappings on LspAttach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = group,
      callback = function(event)
        vim.schedule(function()
          print("=== LSP Attached to buffer " .. event.buf .. " ===")
          local mappings = vim.api.nvim_buf_get_keymap(0, "i")
          print("All insert mode <CR> mappings:")
          for _, km in ipairs(mappings) do
            local key = vim.fn.keytrans(km.lhs)
            if key == "<CR>" then
              print(string.format("  lhs: %s, rhs: %s, desc: %s, callback: %s",
                km.lhs, km.rhs or "nil", km.desc or "nil", km.callback and "yes" or "no"))
            end
          end
        end)
      end,
    })

    return opts
  end,
}
