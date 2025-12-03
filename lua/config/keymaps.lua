-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move lines up and down with Alt+Up/Down (like VS Code)
-- Normal mode: move current line
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", { desc = "Move line up" })

-- Visual mode: move selected lines
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Insert mode: move current line (leave insert mode, move, re-enter insert mode)
vim.keymap.set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })

-- Indentation controls
vim.keymap.set("i", "<S-Tab>", "<C-d>", { desc = "Remove indentation in insert mode" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Remove indentation from selection" })
vim.keymap.set("n", "<Tab>", ">>", { desc = "Indent in normal mode" })
vim.keymap.set("n", "<S-Tab>", "<<", { desc = "Remove indentation in normal mode" })

-- Comment.nvim provides builtin commenting functionality
-- Use:
--   gcc - comment/uncomment current line
--   gc  - comment/uncomment in visual mode
--   gbc - comment/uncomment with block comments
--   gb  - block comment in visual mode


-- Quick theme refresh
vim.keymap.set("n", "<leader>tr", function()
  vim.cmd("Lazy reload tokyonight.nvim")
  -- vim.cmd("colorscheme Default")
end, { desc = "Refresh theme" })

-- LSP reload
vim.keymap.set("n", "<leader>lr", function()
  vim.cmd("LspRestart")
  print("LSP servers restarted")
end, { desc = "Reload LSP servers" })

-- Treesitter capture inspection
vim.keymap.set("n", "<leader>ti", function()
  -- Get treesitter information at cursor
  local captures =
    vim.treesitter.get_captures_at_pos(vim.api.nvim_get_current_buf(), vim.fn.line(".") - 1, vim.fn.col(".") - 1)

  -- Create buffer for floating window
  local buf = vim.api.nvim_create_buf(false, true)
  local lines = {}

  if #captures == 0 then
    table.insert(lines, "No treesitter captures found")
  else
    table.insert(lines, "Treesitter captures:")
    for _, capture in ipairs(captures) do
      local links_to = ""
      local hl_name = "@" .. capture.capture

      -- Safely get highlight link info
      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = hl_name, link = true })
      if ok and hl.link then
        links_to = " links to " .. hl.link
      end

      table.insert(
        lines,
        string.format(
          "  @%s%s priority: %d language: %s",
          capture.capture,
          links_to,
          capture.priority or 0,
          capture.lang or "unknown"
        )
      )
    end
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Create floating window
  local win = vim.api.nvim_open_win(buf, false, {
    relative = "cursor",
    row = 1,
    col = 0,
    width = 70,
    height = math.min(#lines, 20),
    style = "minimal",
    border = "single",
    title = "Treesitter Captures",
    title_pos = "center",
  })

  -- Auto-close when cursor moves
  local close_group = vim.api.nvim_create_augroup("CloseTreesitterInspect", { clear = false })
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "InsertEnter", "WinLeave" }, {
    group = close_group,
    buffer = vim.api.nvim_get_current_buf(),
    once = true,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
      if vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end,
  })
end, { desc = "Show Treesitter captures at cursor" })
