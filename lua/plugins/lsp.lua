return {
  -- configure lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          cmd = { "/usr/local/bin/zls" },
        },
        -- add other lsp servers here as needed
        -- pyright = {},
        -- tsserver = {},
      },
    },
  },

  -- add treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "zig" })
    end,
  },

  -- ensure lsp servers are installed via mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "zls" })
    end,
  },
}

