-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Custom syntax highlighting for Zig files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zig",
  callback = function()
    -- Set up syntax groups for Zig
    vim.cmd([[
      syn match zigFunction /\v\w+\ze(\s*\()/ contained containedin=ALL
      syn match zigKeyword /\v<(pub|fn|const|var|struct|enum|union|async|await|try|catch|defer|errdefer|if|else|while|for|return|comptime|nosuspend|suspend|resume|extern|inline|noinline|export|test)>/
      syn match zigType /\v<[A-Z]\w+>/
      syn match zigBuiltinType /\v<(u8|u16|u32|u64|i8|i16|i32|i64|f32|f64|bool|void|anyerror|noreturn)>/
      syn match zigVariable /\v<\l\w*>/
      syn match zigString /"[^"]*"/
      syn match zigComment /\/\/.*/

      highlight zigFunction ctermfg=226 guifg=#FFD700 cterm=bold gui=bold
      highlight zigKeyword ctermfg=33 guifg=#4169E1 cterm=bold gui=bold
      highlight zigType ctermfg=33 guifg=#4169E1 cterm=bold gui=bold
      highlight zigBuiltinType ctermfg=39 guifg=#1E90FF cterm=bold gui=bold
      highlight zigVariable ctermfg=116 guifg=#87CEEB
      highlight zigString ctermfg=229 guifg=#F1FA8C
      highlight zigComment ctermfg=242 guifg=#6272A4 cterm=italic gui=italic
    ]])
  end,
})

-- Ensure Treesitter is active for Zig
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.zig",
  callback = function()
    vim.cmd("TSBufEnable highlight")
  end,
})