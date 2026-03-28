-- Cursor
vim.opt.cursorline = true

-- UI
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- Tabs / indentation
vim.opt.expandtab = false -- TABS
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.list = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- Scrolling / behavior
vim.opt.smoothscroll = false
vim.opt.cursorline = true

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Undo persistence
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Completion
vim.opt.completeopt = { "menuone", "popup", "noinsert" }

-- Misc
vim.opt.mouse = "a"
vim.opt.selection = "inclusive"
vim.opt.showmode = false
vim.opt.encoding = "UTF-8"
vim.opt.updatetime = 50
vim.opt.errorbells = false


-- Diagnostics
vim.diagnostic.config({
	virtual_text = {
		severity = { min = vim.diagnostic.severity.ERROR }
	},
	signs = false
})
