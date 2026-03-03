return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    -- Key mappings for vim-visual-multi
    -- <C-n> - Start multi-cursor on word under cursor, then add next match
    -- <C-x> - Skip next match
    -- <C-p> - Remove previous cursor
    -- <Leader>ma - Select all occurrences of word in entire buffer
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
      ["Skip Region"] = "<C-x>",
      ["Remove Region"] = "<C-p>",
      ["Select All"] = "<Leader>ma",
    }
    -- Don't remap default mappings
    vim.g.VM_default_mappings = 0
  end,
}