vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Fallback theme
vim.cmd.colorscheme("catppuccin")

require("options")
require("keymaps")
require("plugins")
require("lsp")

vim.cmd([[colorscheme gruvbox]])

-- Floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#504c4b" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#504c4b" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#2c2c2c" })

-- Telescope color overwrites
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {  bg = "#3c3836" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {  bg = "#3c3836" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#504c4b" })
