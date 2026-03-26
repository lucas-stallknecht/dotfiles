vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})
require('gitsigns').setup({ signcolumn = true })

-- Telescope
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim.git" })
vim.pack.add({ "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git" }, {
	build = "make",
	cond = function()
		return vim.fn.executable("make") == 1
	end,
})
vim.pack.add({ { src = "https://github.com/nvim-telescope/telescope.nvim.git" } })

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		preview = false,
		border = true,
		layout_strategy = 'horizontal',
		borderchars = {
			prompt  = { "", "", "", "", "", "", "", "" },
			results = { "", "", "", "", "", "", "", "" },
		},
		selection_caret = "▉ ",
		prompt_prefix = "  ",
		layout_config = {
			width = 0.5,
			height = 0.5,
		},
		file_ignore_patterns = { 'node_modules', 'build', 'third_party' },
		mappings = {
			i = {
				["<Esc>"] = actions.close,
			},
			n = {
				["<Esc>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			prompt_title = false,
			results_title = false,
		},
	},
})

pcall(require("telescope").load_extension, "fzf")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch in [F]iles' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[S]earch in [B]uffers' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
	builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })


-- Mason
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})
require("mason").setup({})
require("mason-lspconfig").setup()

-- Completion
vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})
require('blink.cmp').setup({
	fuzzy = { implementation = 'prefer_rust_with_warning' },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<Tab>"] = {},
		["<S-Tab>"] = {},
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-y>"] = { "select_and_accept" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		}
	},
	sources = { default = { "lsp" } }
})

-- Colors
vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
})
require("vague").setup({
	transparent = true,
	italic = false,
	bold = false,
})

vim.pack.add({
	"https://github.com/ellisonleao/gruvbox.nvim"
})

local gruvbox = require("gruvbox")
gruvbox.setup({
	terminal_colors = false, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = false,
	italic = {
		strings = false,
		emphasis = false,
		comments = true,
		operators = false,
		folds = false,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	inverse = false, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {
        Search = {bg = "#a89984", fg = "#282828" },
        IncSearch = {bg = "#ebdbb2", fg = "#282828"},
	},
	dim_inactive = false,
	transparent_mode = true,
})

-- File explorer
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" }
})
require("oil").setup({})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
