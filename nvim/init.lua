vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.set")
require("config.lazy")
require("config.remap")

vim.cmd.colorscheme("rose-pine")

-- -- Transparent background (useful for telescope overlay)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
