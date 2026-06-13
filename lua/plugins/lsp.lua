return {
  -- configure lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          cmd = { "/usr/local/bin/zls" },
          -- Build-on-save runs the project's default build step on save.
          -- Replaces the old nvim-lint `zig build` hack: surfaces compile
          -- errors as diagnostics, AND (re)builds the timestamped dynlib so
          -- hot reload kicks in on save. Don't add `build_on_save_args =
          -- {"check"}` here -- a check step uses -fno-emit-bin and would not
          -- emit the dynlib, breaking hot reload.
          settings = {
            zls = {
              enable_build_on_save = true,
            },
          },
        },
        clangd = {}, -- C/C++ LSP
        jdtls = {}, -- Java LSP
        glsl_analyzer = {}, -- GLSL LSP
        omnisharp = {
          cmd = { vim.env.HOME .. "/.local/share/nvim/mason/bin/OmniSharp" },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
        },
      },
    },
  },

  -- add treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "zig", "java", "c_sharp", "c", "cpp", "glsl" })
    end,
  },

  -- ensure lsp servers are installed via mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "zls", "clangd", "jdtls", "omnisharp", "glsl_analyzer" })
    end,
  },
}
