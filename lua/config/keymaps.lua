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

-- Generic comment toggle function
local function toggle_comment()
  -- Get comment string based on file type
  local comment_strings = {
    lua = "--",
    python = "#",
    javascript = "//",
    typescript = "//",
    javascriptreact = "//",
    typescriptreact = "//",
    css = "/*",
    html = "<!--",
    zig = "//",
    c = "//",
    cpp = "//",
    rust = "//",
    go = "//",
    java = "//",
    php = "//",
    ruby = "#",
    sh = "#",
    bash = "#",
    zsh = "#",
    fish = "#",
    json = "",
    yaml = "#",
    toml = "#",
    markdown = "<!--",
  }

  local ft = vim.bo.filetype
  local comment_str = comment_strings[ft] or "//" -- default to //

  -- Get current line
  local line = vim.api.nvim_get_current_line()

  -- Check if line is already commented
  local is_commented = false
  if comment_str ~= "" then
    is_commented = string.match(line, "^%s*" .. vim.pesc(comment_str))
  end

  if is_commented then
    -- Remove comment
    local new_line = string.gsub(line, "^%s*" .. vim.pesc(comment_str) .. "%s*", "")
    vim.api.nvim_set_current_line(new_line)
  else
    -- Add comment
    local new_line = comment_str .. " " .. line
    vim.api.nvim_set_current_line(new_line)
  end
end

-- Toggle comment on current line
vim.keymap.set("n", "<leader>c", toggle_comment, { desc = "Toggle comment line" })

-- Toggle comment on selection
vim.keymap.set("v", "<leader>c", function()
  -- Get selection range
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local start_line = start_pos[2]
  local end_line = end_pos[2]

  -- Get comment string
  local comment_strings = {
    lua = "--",
    python = "#",
    javascript = "//",
    typescript = "//",
    javascriptreact = "//",
    typescriptreact = "//",
    css = "/*",
    html = "<!--",
    zig = "//",
    c = "//",
    cpp = "//",
    rust = "//",
    go = "//",
    java = "//",
    php = "//",
    ruby = "#",
    sh = "#",
    bash = "#",
    zsh = "#",
    fish = "#",
    json = "",
    yaml = "#",
    toml = "#",
    markdown = "<!--",
  }

  local ft = vim.bo.filetype
  local comment_str = comment_strings[ft] or "//"

  -- Check if all lines are commented
  local all_commented = true
  for i = start_line, end_line do
    local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1] or ""
    if comment_str ~= "" then
      if not string.match(line, "^%s*" .. vim.pesc(comment_str)) then
        all_commented = false
        break
      end
    else
      all_commented = false
      break
    end
  end

  -- Toggle comments
  for i = start_line, end_line do
    local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1] or ""
    if all_commented then
      -- Remove comment
      local new_line = string.gsub(line, "^%s*" .. vim.pesc(comment_str) .. "%s*", "")
      vim.api.nvim_buf_set_lines(0, i - 1, i, false, { new_line })
    else
      -- Add comment
      local new_line = comment_str .. " " .. line
      vim.api.nvim_buf_set_lines(0, i - 1, i, false, { new_line })
    end
  end
end, { desc = "Toggle comment selection" })
