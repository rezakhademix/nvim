-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- php extra defaults to phpactor; use intelephense instead
vim.g.lazyvim_php_lsp = "intelephense"

local opt = vim.opt
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
