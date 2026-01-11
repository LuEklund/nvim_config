return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      local function strip_ansi(s)
        return (s:gsub("\27%[[0-9;]*m", ""))
      end

      lint.linters.zig_build = {
        name = "zig_build",
        cmd = "zig",
        stdin = false,
        args = { "build" },
        append_fname = false,
        stream = "stderr",
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local diags = {}
          local cur = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr or 0), ":p")

          for _, line in ipairs(vim.split(strip_ansi(output), "\n", { trimempty = true })) do
            local file, lnum, col, msg = line:match("^(.+):(%d+):(%d+):%s*error:%s*(.+)$")
            if file then
              file = vim.fn.fnamemodify(file, ":p")
              if file == cur then
                diags[#diags + 1] = {
                  lnum = tonumber(lnum) - 1,
                  col = tonumber(col) - 1,
                  message = msg,
                  severity = vim.diagnostic.severity.ERROR,
                  source = "zig build",
                }
              end
            end
          end

          return diags
        end,
      }

      lint.linters_by_ft = lint.linters_by_ft or {}
      lint.linters_by_ft.zig = { "zig_build" }
    end,
  },
}
