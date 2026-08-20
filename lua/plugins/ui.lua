return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },

  {
    "dstein64/nvim-scrollview",
    opts = { scrollview_base = "left" },
  },

  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>e",
        function()
          Snacks.explorer({ cwd = vim.fn.getcwd() })
        end,
        desc = "Explorer (cwd)",
      },
    },
    opts = {
      explorer = {},
      picker = {
        sources = {
          explorer = {
            hidden = false,
            ignored = false,
            actions = {
              toggle_hidden_ignored = function(picker)
                local show = not picker.opts.hidden
                picker.opts.hidden = show
                picker.opts.ignored = show
                picker:find()
              end,
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
                  ["<a-i>"] = "toggle_hidden_ignored",
                },
              },
            },
          },
        },
      },
    },
  },
}
