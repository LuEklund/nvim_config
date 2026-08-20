vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- options
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smoothscroll = false
vim.opt.jumpoptions = ""
vim.opt.scrolloff = 0
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- bootstrap lazy.nvim (plugin manager only, no LazyVim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = { { import = "plugins" } },
  defaults = { lazy = false },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = false },
})

require("keymaps")
