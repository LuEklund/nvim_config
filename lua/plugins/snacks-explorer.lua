return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      toggles = {
        hidden = "alt+h",
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
