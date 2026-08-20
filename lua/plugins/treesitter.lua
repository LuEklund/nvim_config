return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "cpp", "zig", "lua", "glsl", "vimdoc", "markdown" },
      highlight = { enable = true },
    })
  end,
}
