return {
  "folke/snacks.nvim",
  keys = {
    -- Open the explorer at the current working directory instead of LazyVim.root(),
    -- which otherwise walks up to a .git/lua marker or LSP root and jumps a dir up.
    {
      "<leader>e",
      function()
        Snacks.explorer({ cwd = vim.fn.getcwd() })
      end,
      desc = "Explorer Snacks (cwd)",
    },
    {
      "<leader>fe",
      function()
        Snacks.explorer({ cwd = vim.fn.getcwd() })
      end,
      desc = "Explorer Snacks (cwd)",
    },
  },
  opts = {
    picker = {
      toggles = {
        hidden = "alt+i",
        ignored = "alt+i",
      },
      sources = {
        explorer = {
          hidden = false,
          ignored = false,
          actions = {
            confirm_keep_focus = function(picker, item, action)
              require("snacks.explorer.actions").actions.confirm(picker, item, action)
              vim.schedule(function()
                if picker.list and picker.list.win then
                  picker.list.win:focus()
                end
              end)
            end,
          },
          win = {
            list = {
              keys = {
                ["<CR>"] = "confirm_keep_focus",
                ["l"] = "confirm_keep_focus",
              },
            },
          },
        },
      },
    },
  },
}
