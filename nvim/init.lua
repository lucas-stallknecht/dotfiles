vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.set")
require("config.lazy")
require("config.remap")

local theme  = {
    name = "rose_pine",
    style = "main",
    transparent = true,
}

local themes = require("theming.themes")
themes.activate_theme(theme.name, theme.style, theme.transparent)

-- Transparent background (useful for telescope overlay)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
