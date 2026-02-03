return {
  -- configure lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          cmd = { "/usr/local/bin/zls" },
        },
        jdtls = {}, -- Java LSP
        -- add other lsp servers here as needed
        -- pyright = {},
        -- tsserver = {},
      },
      omnisharp = {
        cmd = { vim.env.HOME .. "/.local/share/nvim/mason/bin/OmniSharp" },
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
      },
    },
  },

  -- add treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "zig", "java", "c_sharp", "c_sharp" })
    end,
  },

  -- ensure lsp servers are installed via mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "zls", "jdtls", "omnisharp" })
    end,
  },
}
