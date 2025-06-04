vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.set")
require("config.lazy")
require("config.remap")

-- Color theme
vim.cmd [[colorscheme vague]]
vim.api.nvim_set_hl(0, "QuickFixLine", { fg = "#ffffff", bg = "NONE", bold = true })

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
