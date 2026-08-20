local set = vim.keymap.set


set("n", "<ESC>", "<cmd>noh<cr>")

-- no arrow keys
set({ "n", "v", "i" }, "<Left>", function() vim.cmd('echo "No left for you"') end)
set({ "n", "v", "i" }, "<Right>", function() vim.cmd('echo "No right for you"') end)
set({ "n", "v", "i" }, "<Up>", function() vim.cmd('echo "No up for you"') end)
set({ "n", "v", "i" }, "<Down>", function() vim.cmd('echo "No down for you"') end)

-- jump to end / start of line (H/L don't collide with text-object prefixes like a)
set({ "n", "v" }, "L", "$")
set({ "n", "v" }, "H", "^")
set("n", "+", "$")
set({ "n", "x", "o" }, "¤", "$")
set("i", "<C-a>", "<End>", { silent = true })

-- move lines (supports counts)
local function move_down()
  vim.cmd("move .+" .. vim.v.count1)
  vim.cmd("normal! ==")
end
local function move_up()
  vim.cmd("move .-" .. (vim.v.count1 + 1))
  vim.cmd("normal! ==")
end
set("n", "<M-Down>", move_down, { desc = "Move line down" })
set("n", "<M-Up>", move_up, { desc = "Move line up" })
set("n", "<C-j>", move_down, { desc = "Move line down" })
set("n", "<C-k>", move_up, { desc = "Move line up" })
set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
set("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })

-- indentation
set("i", "<S-Tab>", "<C-d>", { desc = "Remove indentation in insert mode" })
set("v", "<Tab>", ">gv", { desc = "Indent selection" })
set("v", "<S-Tab>", "<gv", { desc = "Remove indentation from selection" })
set("n", "<Tab>", ">>", { desc = "Indent in normal mode" })
set("n", "<S-Tab>", "<<", { desc = "Remove indentation in normal mode" })
set("n", "<C-i>", "<C-i>", { desc = "Jump forward" })

-- toggles
set("n", "<leader>ti", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
set("n", "<leader>tw", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle line wrap" })
set("n", "<leader>tc", function()
  vim.g.drill_mode = not vim.g.drill_mode
  print(vim.g.drill_mode and "drill mode: completion OFF" or "completion ON")
end, { desc = "Toggle completion (drill mode)" })

-- lsp
set("n", "<leader>lr", function()
  vim.cmd("LspRestart")
  print("LSP servers restarted")
end, { desc = "Reload LSP servers" })
set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
set("n", "gd", function() require("fzf-lua").lsp_definitions() end, { desc = "Goto definition" })
set("n", "gr", function() require("fzf-lua").lsp_references() end, { desc = "References" })
set("n", "gi", function() require("fzf-lua").lsp_implementations() end, { desc = "Goto implementation" })
set("n", "<leader>ss", function() require("fzf-lua").lsp_document_symbols() end, { desc = "Document symbols" })
set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- pickers (Helix: Space d = buffer diagnostics, Space D = workspace)
set("n", "<leader>d", function() require("fzf-lua").diagnostics_document() end, { desc = "Diagnostics (buffer)" })
set("n", "<leader>D", function() require("fzf-lua").diagnostics_workspace() end, { desc = "Diagnostics (workspace)" })
set("n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "Find files" })
set("n", "<leader><leader>", function() require("fzf-lua").files() end, { desc = "Find files" })
set("n", "<leader>fg", function() require("fzf-lua").live_grep() end, { desc = "Live grep" })
set("n", "<leader>sg", function() require("fzf-lua").live_grep() end, { desc = "Live grep" })
set("n", "<leader>/", function() require("fzf-lua").live_grep() end, { desc = "Live grep" })
set("n", "<leader>,", function() require("fzf-lua").buffers() end, { desc = "Buffers" })
set("n", "<leader>fr", function() require("fzf-lua").oldfiles() end, { desc = "Recent files" })

-- treesitter capture inspection
set("n", "<leader>tI", function()
  local captures =
    vim.treesitter.get_captures_at_pos(vim.api.nvim_get_current_buf(), vim.fn.line(".") - 1, vim.fn.col(".") - 1)

  local buf = vim.api.nvim_create_buf(false, true)
  local lines = {}

  if #captures == 0 then
    table.insert(lines, "No treesitter captures found")
  else
    table.insert(lines, "Treesitter captures:")
    for _, capture in ipairs(captures) do
      local links_to = ""
      local hl_name = "@" .. capture.capture
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
